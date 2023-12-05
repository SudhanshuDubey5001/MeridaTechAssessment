import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meridatech_assessment/model/ShopItem.dart';
import 'package:meridatech_assessment/model/Transaction_SBI.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import 'package:meridatech_assessment/utils/Utils.dart';

import '../model/UserSBI.dart';

class DatabaseService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('CartHistory');

  final CollectionReference _refBankAccount =
      FirebaseFirestore.instance.collection("SBIAccounts");

  Future addItemsToOrderHistory(List<ShopItem> items) async {
    List<Map<String, dynamic>> itemsAsMaps = items.map((item) {
      return {
        'item_id': item.id,
        'item_name': item.itemName,
        'item_price': item.itemPrice,
        'item.quantity': item.quantity,
        'item_imageURL': item.imageURL
      };
    }).toList();

    for (int i = 0; i < itemsAsMaps.length; i++) {
      await _collectionReference
          .doc(Constants.userSBI.uid)
          .collection('items')
          .add(itemsAsMaps[i]);
      print("loop");
    }

    return true;
  }

  Future<List<ShopItem>> fetchOrderHistory() async {
    List<ShopItem> itemsList = [];

    try {
      QuerySnapshot querySnapshot = await _collectionReference
          .doc(Constants.userSBI.uid)
          .collection('items')
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        ShopItem item = ShopItem(
          id: data['item_id'] ?? 0,
          itemName: data['item_name'] ?? "",
          itemPrice: (data['item_price'] ?? 0.0).toDouble(),
          imageURL: data['item_imageURL'] ?? "",
          quantity: data['item.quantity'] ?? 0,
          totalPriceOfItem: (data['totalPriceOfItem'] ?? 0.0).toDouble(),
        );

        itemsList.add(item);
        print(item.itemName);
      }

      return itemsList;
    } catch (e) {
      print("Error fetching items: $e");
      return [];
    }
  }

  Future addUserDetailsToFirestore(UserSBI user) async {
    Map<String, dynamic> user_details_map = {
      'user_uid': user.uid,
      'user_name': user.name,
      'user_address': user.address,
      'saving_account_balance': user.saving_account_balance,
    };
    await _refBankAccount.doc(user.uid).set(user_details_map);

    return true;
  }

  Future<UserSBI> fetchUser(String key) async {
    final docRef = _refBankAccount.doc(key);
    UserSBI userSBI = UserSBI(uid: '-1');
    await docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        userSBI = UserSBI(
            uid: key,
            name: data['user_name'],
            address: data['user_address'],
            saving_account_balance: data['saving_account_balance']);
      },
      onError: (e) => print('Error : ${e.toString()}'),
    );
    return userSBI;
  }

  Future depositAmount(double amount) async {
    double newValue = Constants.userSBI.saving_account_balance + amount;
    await _refBankAccount
        .doc(Constants.userSBI.uid)
        .update({'saving_account_balance': newValue}).then(
            (value) => {
                  Constants.userSBI.saving_account_balance = newValue,
                  print("SavingAccount amount deposited!")
                },
            onError: (e) => print("Error updating document $e"));
  }

  Future performWithdrawl(double withdrawlAmount) async {
    final docRef = _refBankAccount.doc(Constants.userSBI.uid);
    await docRef.get().then(
      (DocumentSnapshot doc) async {
        final data = doc.data() as Map<String, dynamic>;
        double savingAccount = data['saving_account_balance'] as double;
        double newValue = savingAccount - withdrawlAmount;
        await _refBankAccount
            .doc(Constants.userSBI.uid)
            .update({'saving_account_balance': newValue}).then(
                (value) => {
                      Constants.userSBI.saving_account_balance = newValue,
                      print("SavingAccount successfully updated!")
                    },
                onError: (e) => print("Error updating document $e"));
      },
      onError: (e) => print("Error getting document: $e"),
    );
    await recordTransaction(withdrawlAmount);
  }

  Future recordTransaction(double withdrawlAmount) async {
    Utils utils = Utils();
    String date = utils.getTodayDate();
    String time = utils.getNowTime();

    Map<String, dynamic> map_tranc = {
      'withdrawl_amount': withdrawlAmount,
      'dote_of_withdrawl': date,
      'time_of_withdrawl': time
    };

    await _refBankAccount
        .doc(Constants.userSBI.uid)
        .collection("history")
        .add(map_tranc);
    print("Transaction history recorded");
  }

  Future<List<Transaction_SBI>> fetchTransactionHistory() async {
    List<Transaction_SBI> transaction_history = [];

    try {
      QuerySnapshot querySnapshot = await _refBankAccount
          .doc(Constants.userSBI.uid)
          .collection('history')
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        Transaction_SBI trancs = Transaction_SBI(
          withdrawl_amount: data['withdrawl_amount'] ?? 0.0,
          dote_of_withdrawl: data['dote_of_withdrawl'] ?? "",
          time_of_withdrawl: data['time_of_withdrawl'] ?? "",
        );

        transaction_history.add(trancs);
        print(trancs.withdrawl_amount);
      }

      return transaction_history;
    } catch (e) {
      print("Error fetching items: $e");
      return [];
    }
  }
}
