import 'package:flutter/material.dart';
import 'package:meridatech_assessment/templates/CartItemTemplate.dart';
import 'package:meridatech_assessment/utils/Routes.dart';
import '../Controller.dart';
import '../utils/Constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
          centerTitle: true,
          backgroundColor: Constants.primaryColor,
        ),
        body: Stack(
          children: [
            Visibility(
                visible: Controller.getCartItems().isEmpty,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/empty_cart.png'),
                )),
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: Controller.getCartItems().map((shopItem) {
                        return Container(
                          child: CartItemTemplate(
                              shopItem: shopItem,
                              increment: () {
                                setState(() {
                                  Controller.addItemToCart(shopItem);
                                });
                              },
                              decrement: () {
                                setState(() {
                                  Controller.removeItemFromCart(shopItem);
                                });
                              }),
                        );
                      }).toList()),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.primaryColor),
              onPressed: () {
                if(Controller.getCartItems().isNotEmpty)
                  Navigator.pushNamed(context, Routes.checkout_screen);
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Your cart is empty!'),
                      )
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '₹ ${Controller.getTotalPriceOfAllItems().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
              ),
            )
          ],
        ));
  }
}
