class ShopItem {
  int id;
  String itemName;
  double itemPrice;
  String imageURL;
  int quantity;
  double totalPriceOfItem;

  ShopItem(
      {required this.id,
      required this.itemName,
      required this.itemPrice,
      required this.imageURL,
      this.quantity = 0,
      this.totalPriceOfItem = 0});
}
