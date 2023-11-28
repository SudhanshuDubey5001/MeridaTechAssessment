import 'package:flutter/material.dart';
import 'package:meridatech_assessment/Controller.dart';
import 'package:meridatech_assessment/model/ShopUser.dart';
import 'package:meridatech_assessment/pages/OrderHistoryScreen.dart';
import 'package:meridatech_assessment/pages/auth/AuthScreen_signin.dart';
import 'package:meridatech_assessment/services/auth.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import 'package:provider/provider.dart';

import '../utils/Routes.dart';
import 'CartScreen.dart';
import 'CheckoutScreen.dart';
import 'ShopScreen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    ShopUser shopUser = Provider.of<ShopUser>(context);
    if (shopUser.uid == "-1") {
      return const AuthScreenSignIn();
    } else {
      Constants.shopUser = shopUser;
      return MaterialApp(
        initialRoute: Routes.shop_screen,
        routes: {
          Routes.shop_screen: (context) => const ShopScreen(),
          Routes.cart_screen: (context) => const CartScreen(),
          Routes.checkout_screen: (context) => const CheckOutScreen(),
          Routes.order_history: (context) => const OrderHistoryScreen(),
        },
      );
    }
  }
}
