import 'package:flutter/material.dart';
import 'package:meridatech_assessment/Controller.dart';
import 'package:meridatech_assessment/services/auth.dart';
import 'package:meridatech_assessment/services/cloud_database.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import 'package:meridatech_assessment/utils/Routes.dart';
import '../model/ShopItem.dart';
import '../templates/ShopItemTemplate.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  Controller controller = Controller();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping"),
          centerTitle: true,
          backgroundColor: Constants.primaryColor,
          foregroundColor: Colors.white,
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      if (controller.getCartItems().isNotEmpty) {
                        Navigator.pushNamed(context, Routes.cart_screen)
                            .then((value) {
                          setState(() {});
                        });
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text('Your cart is empty!'),
                        ));
                      }
                    },
                  ),
                  Positioned(
                    right: 2,
                    top: 1,
                    child: CircleAvatar(
                      backgroundColor: Constants.secondaryColor,
                      radius: 10,
                      child: Text(
                        controller.getCartItems().length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (String result) async{
                if (result == 'history') {
                  //fetch items
                  DatabaseService db = DatabaseService();
                  List<ShopItem> items = await db.fetchOrderHistory();
                  Controller().setOrderHistoryItems(items);

                  Navigator.pushNamed(context, Routes.order_history);
                } else if (result == 'signOut') {
                  await _authService.signOut();
                }
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'history',
                  child: Text('Order History'),
                ),
                const PopupMenuItem<String>(
                  value: 'signOut',
                  child: Text('Sign Out'),
                ),
              ],
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: controller.getdummyShoppingData().map((shopItem) {
                  return Container(
                    child: ShopItemTemplate(
                        shopItem: shopItem,
                        addToCartButton: () {
                          setState(() {
                            controller.addItemToCart(shopItem);
                          });
                        }),
                  );
                }).toList()),
          ),
        ));
  }
}
