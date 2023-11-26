import 'package:flutter/material.dart';
import 'package:meridatech_assessment/templates/components/add_cart_button.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import '../model/ShopItem.dart';

class ShopItemTemplate extends StatelessWidget {
  final ShopItem shopItem;
  final Function() addToCartButton;

  ShopItemTemplate(
      {super.key, required this.shopItem, required this.addToCartButton});

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
                  AddCartButton(
                      addToCartButton: addToCartButton)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
