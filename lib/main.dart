
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meridatech_assessment/model/ShopItem.dart';
import 'package:meridatech_assessment/model/ShopUser.dart';
import 'package:meridatech_assessment/pages/OrderHistoryScreen.dart';
import 'package:meridatech_assessment/pages/auth/AuthScreen_signin.dart';
import 'package:meridatech_assessment/pages/CartScreen.dart';
import 'package:meridatech_assessment/pages/CheckoutScreen.dart';
import 'package:meridatech_assessment/pages/ShopScreen.dart';
import 'package:meridatech_assessment/pages/Wrapper.dart';
import 'package:meridatech_assessment/services/auth.dart';
import 'package:meridatech_assessment/services/cloud_database.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import 'package:meridatech_assessment/utils/Routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Controller.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeFirebase();

  // runApp(MaterialApp(
  //     initialRoute: Routes.shop_screen,
  //     routes: {
  //       Routes.shop_screen: (context) => const ShopScreen(),
  //       Routes.cart_screen: (context) => const CartScreen(),
  //       Routes.checkout_screen: (context) => const CheckOutScreen(),
  //     },
  //   ));
}

void initializeFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  print("initialized!!");

  try {
    runApp(StreamProvider<ShopUser>.value(
      value: AuthService().userStream ?? Stream.value(ShopUser(uid: "-1")),
      initialData: ShopUser(uid: "-1"),
      child: const MaterialApp(
        home: Wrapper(),
      ),
    ));
  }catch(e){
    print(e.toString());
  }
}
