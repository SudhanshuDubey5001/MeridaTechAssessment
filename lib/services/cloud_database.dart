import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meridatech_assessment/model/ShopItem.dart';
import 'package:meridatech_assessment/utils/Constants.dart';

class DatabaseService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('CartHistory');

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
          .doc(Constants.shopUser.uid)
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
          .doc(Constants.shopUser.uid)
          .collection('items')
          .get();

      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
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
}
