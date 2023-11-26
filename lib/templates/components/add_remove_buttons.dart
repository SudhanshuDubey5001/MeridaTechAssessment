import 'package:flutter/material.dart';
import '../../utils/Constants.dart';

class AddRemoveButtons extends StatelessWidget {

  final Function() addButton;
  final Function() removeButton;
  int quantity;

  AddRemoveButtons({super.key,
    required this.quantity,
    required this.addButton,
    required this.removeButton});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: IconButton(
            onPressed: removeButton,
            icon: Icon(Icons.remove),
            color: Colors.white,
          ),
        ),
        SizedBox(width: 20),
        Text(quantity.toString()), // Replace with actual quantity
        SizedBox(width: 20),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Constants.primaryColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: IconButton(
            onPressed: addButton,
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
