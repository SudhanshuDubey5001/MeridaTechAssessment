import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meridatech_assessment/main.dart';
import 'package:meridatech_assessment/model/ShopItem.dart';
import 'package:meridatech_assessment/pages/auth/AuthScreen_signin.dart';
import 'package:meridatech_assessment/pages/ShopScreen.dart';
import 'package:meridatech_assessment/utils/Constants.dart';
import 'package:meridatech_assessment/utils/DummyData.dart';

class Controller {
  // make the class singleton
  static Controller? _instance;

  Controller._();

  factory Controller() => _instance ??= Controller._();

  DummyData _shopdata = DummyData();

  List<ShopItem> getdummyShoppingData() => _shopdata.items;

  int _totalItemCount = 0;

  get getTotalCartItemCount => _totalItemCount;

  double _totalPriceOfAllItems = 0;

  double getTotalPriceOfAllItems() => _totalPriceOfAllItems;

  List<ShopItem> _cart = [];

  List<ShopItem> getCartItems() => _cart;

  List<ShopItem> _orderHistoryItems = [];

  List<ShopItem> getOrderHistoryItems() => _orderHistoryItems;

  void setOrderHistoryItems(List<ShopItem> items) {
    _orderHistoryItems = items;
  }

  void addItemToCart(ShopItem item) {
    item.quantity++;
    item.totalPriceOfItem = item.quantity * item.itemPrice;
    if (!_cart.contains(item)) {
      item.quantity = 1;
      _cart.add(item);
    }
    _totalItemCount++;
    _totalPriceOfAllItems += item.itemPrice;
  }

  void removeItemFromCart(ShopItem item) {
    if (item.quantity >= 0) item.quantity--;
    item.totalPriceOfItem = item.quantity * item.itemPrice;
    if (_totalPriceOfAllItems >= item.itemPrice) {
      _totalPriceOfAllItems -= item.itemPrice;
    } else {
      _totalPriceOfAllItems = 0;
    }
    if (item.quantity == 0) _cart.remove(item);
    if (_totalItemCount > 0) _totalItemCount--;
  }

  double totalPriceOfSingleItem(ShopItem item) {
    return item.itemPrice * item.quantity;
  }

  void resetValues() {
    _totalPriceOfAllItems = 0;
    _totalItemCount = 0;
    _cart.clear();
    _cart = [];
  }
}
