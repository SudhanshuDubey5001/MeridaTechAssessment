import 'package:flutter/material.dart';
import 'package:meridatech_assessment/Controller.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import 'package:meridatech_assessment/utils/Routes.dart';
import '../templates/ShopItemTemplate.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping"),
          centerTitle: true,
          backgroundColor: Constants.primaryColor,
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      if(Controller.getCartItems().isNotEmpty) {
                        Navigator.pushNamed(context, Routes.cart_screen).then((value){
                          setState(() {});
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Your cart is empty!'),
                            )
                        );
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
                        Controller.getCartItems().length.toString(),
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
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: Controller.getdummyShoppingData().map((shopItem) {
                  return Container(
                    child: ShopItemTemplate(
                        shopItem: shopItem,
                        addToCartButton: () {
                          setState(() {
                            Controller.addItemToCart(shopItem);
                          });
                        }),
                  );
                }).toList()),
          ),
        ));
  }
}
