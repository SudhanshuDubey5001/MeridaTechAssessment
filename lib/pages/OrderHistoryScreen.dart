import 'package:flutter/material.dart';
import 'package:meridatech_assessment/Controller.dart';

import '../templates/OrderHistoryTemplate.dart';
import '../utils/Constants.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Controller();
    // print(controller.getOrderHistoryItems().map((e) => e.itemName));
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      appBar: AppBar(
        title: Text("Order History"),
        centerTitle: true,
        backgroundColor: Constants.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: controller.getOrderHistoryItems().map((item) {
              return Container(
                child: OrderHistoryTemplate(shopItem: item),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
