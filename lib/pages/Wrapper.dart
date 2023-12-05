import 'package:flutter/material.dart';
import 'package:meridatech_assessment/Controller.dart';
import 'package:meridatech_assessment/model/UserSBI.dart';
import 'package:meridatech_assessment/pages/OrderHistoryScreen.dart';
import 'package:meridatech_assessment/pages/SBIAccount.dart';
import 'package:meridatech_assessment/pages/TransactionHistoryPage.dart';
import 'package:meridatech_assessment/pages/auth/AuthScreen_signin.dart';
import 'package:meridatech_assessment/services/auth.dart';
import 'package:meridatech_assessment/services/cloud_database.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import 'package:provider/provider.dart';

import '../utils/Routes.dart';
import 'CartScreen.dart';
import 'CheckoutScreen.dart';
import 'ShopScreen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  DatabaseService db = DatabaseService();

  void getUser(UserSBI userSBI) async {
    Constants.userSBI = await db.fetchUser(userSBI.uid);
  }

  @override
  Widget build(BuildContext context) {
    UserSBI userSBI = Provider.of<UserSBI>(context);
    getUser(userSBI);
    print("Wrapper screen == UID === ${userSBI.uid}");
    print("Wrapper screen == Name === ${userSBI.name}");
    if (userSBI.uid == "-1") {
      return const AuthScreenSignIn();
    } else {
      return MaterialApp(
        initialRoute: Routes.sbi_account,
        routes: {
          Routes.sbi_account: (context) => const SBIAccountScreen(),
          Routes.transactions: (context) => const TransactionHistoryPage(),
          Routes.shop_screen: (context) => const ShopScreen(),
          Routes.cart_screen: (context) => const CartScreen(),
          Routes.checkout_screen: (context) => const CheckOutScreen(),
          Routes.order_history: (context) => const OrderHistoryScreen(),
        },
      );
    }
  }
}
