import 'dart:developer';

import 'package:meridatech_assessment/model/ShopItem.dart';
import 'package:meridatech_assessment/utils/DummyData.dart';

class Controller {
  static DummyData _shopdata = DummyData();
  static List<ShopItem> getdummyShoppingData() => _shopdata.items;

  static int _totalItemCount = 0;
  static get getTotalCartItemCount => _totalItemCount;

  static double _totalPriceOfAllItems = 0;
  static double getTotalPriceOfAllItems() => _totalPriceOfAllItems;

  static List<ShopItem> _cart = [];
  static List<ShopItem> getCartItems() => _cart;

  static void addItemToCart(ShopItem item) {
    item.quantity++;
    item.totalPriceOfItem = item.quantity * item.itemPrice;
    if (!_cart.contains(item)) {
      item.quantity = 1;
      _cart.add(item);
      print("Cart item added : "+item.itemName);
    }else{
      print("quantity = "+item.quantity.toString());
    }
    _totalItemCount++;
    _totalPriceOfAllItems += item.itemPrice;
  }

  static void removeItemFromCart(ShopItem item) {
    if (item.quantity >= 0) item.quantity--;
    item.totalPriceOfItem = item.quantity * item.itemPrice;
    if (_totalPriceOfAllItems >= item.itemPrice) {
      _totalPriceOfAllItems -= item.itemPrice;
    }else {
      _totalPriceOfAllItems = 0;
    }
    if (item.quantity == 0) _cart.remove(item);
    if (_totalItemCount > 0) _totalItemCount--;
  }

  static double totalPriceOfSingleItem(ShopItem item) {
    return item.itemPrice * item.quantity;
  }

  static void resetValues(){
    _totalPriceOfAllItems = 0;
    _totalItemCount = 0;
    _shopdata.items[0].quantity = 0;
    _cart.clear();
    _cart = [];
  }
}
