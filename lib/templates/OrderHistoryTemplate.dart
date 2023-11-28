import 'package:flutter/material.dart';

import '../model/ShopItem.dart';
import '../utils/Constants.dart';

class OrderHistoryTemplate extends StatefulWidget {
  final ShopItem shopItem;

  OrderHistoryTemplate(
      {super.key, required this.shopItem});

  @override
  State<OrderHistoryTemplate> createState() => _OrderHistoryTemplateState();
}

class _OrderHistoryTemplateState extends State<OrderHistoryTemplate> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
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
                  widget.shopItem.imageURL,
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
                    widget.shopItem.itemName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '₹ ${widget.shopItem.itemPrice}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constants.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Quantity bought: ${widget.shopItem.quantity}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constants.secondaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );;
  }
}
