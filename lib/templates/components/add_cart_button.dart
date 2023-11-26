import 'package:flutter/material.dart';
import 'package:meridatech_assessment/utils/Constants.dart';

import '../../Controller.dart';

class AddCartButton extends StatelessWidget {
  final Function() addToCartButton;

  AddCartButton(
      {super.key, required this.addToCartButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: addToCartButton,
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.primaryColor,
        foregroundColor: Colors.white,
      ),
      child: Text('Add to Cart'),
    );
  }
}
