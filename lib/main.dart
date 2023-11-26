import 'package:flutter/material.dart';
import 'package:meridatech_assessment/pages/CartScreen.dart';
import 'package:meridatech_assessment/pages/CheckoutScreen.dart';
import 'package:meridatech_assessment/pages/ShopScreen.dart';
import 'package:meridatech_assessment/utils/Routes.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: Routes.shop_screen,
    routes: {
      Routes.shop_screen: (context) => const ShopScreen(),
      Routes.cart_screen: (context) => const CartScreen(),
      Routes.checkout_screen: (context) => const CheckOutScreen(),
    },
  ));
}
