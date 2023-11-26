import 'package:flutter/material.dart';
import 'package:meridatech_assessment/templates/components/add_remove_buttons.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import '../model/ShopItem.dart';

class CartItemTemplate extends StatelessWidget {
  final ShopItem shopItem;
  final Function() increment;
  final Function() decrement;

  CartItemTemplate(
      {super.key,
      required this.shopItem,
      required this.increment,
      required this.decrement});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  shopItem.imageURL,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/placeholder_image.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    shopItem.itemName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '₹ ${shopItem.itemPrice}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constants.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  AddRemoveButtons(
                      quantity: shopItem.quantity,
                      addButton: increment,
                      removeButton: decrement),
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '₹ ${shopItem.totalPriceOfItem.toStringAsFixed(2)}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Constants.secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
