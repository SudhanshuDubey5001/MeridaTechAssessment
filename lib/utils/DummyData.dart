import '../model/ShopItem.dart';

class DummyData {

  static DummyData? _instance;

  DummyData._();

  factory DummyData() => _instance ??= DummyData._();

  List<ShopItem> items = [
    ShopItem(id: 1, itemName: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", itemPrice: 109.95, imageURL: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg"),
    ShopItem(id: 2, itemName: "Mens Casual Premium Slim Fit T-Shirts", itemPrice: 22.3, imageURL: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg"),
    ShopItem(id: 3, itemName: "Mens Cotton Jacket", itemPrice: 55.99, imageURL: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg"),
    ShopItem(id: 4, itemName: "Mens Casual Slim Fit", itemPrice: 15.99, imageURL: "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg"),
    ShopItem(id: 5, itemName: "John Hardy Women's Legends Naga Gold & Silver Dragon Station Chain Bracelet", itemPrice: 695, imageURL: "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg"),
    ShopItem(id: 6, itemName: "Solid Gold Petite Micropave", itemPrice: 168, imageURL: "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg"),
    ShopItem(id: 7, itemName: "White Gold Plated Princess", itemPrice: 9.99, imageURL: "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg"),
    ShopItem(id: 8, itemName: "Pierced Owl Rose Gold Plated Stainless Steel Double", itemPrice: 10.99, imageURL: "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg"),
    ShopItem(id: 9, itemName: "WD 2TB Elements Portable External Hard Drive - USB 3.0", itemPrice: 64, imageURL: "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg"),
    ShopItem(id: 10, itemName: "SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s", itemPrice: 109, imageURL: "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg"),
    ShopItem(id: 11, itemName: "Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5", itemPrice: 109, imageURL: "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg"),
    ShopItem(id: 12, itemName: "WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive", itemPrice: 114, imageURL: "https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg"),
    ShopItem(id: 13, itemName: "Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin", itemPrice: 599, imageURL: "https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg"),
    ShopItem(id: 14, itemName: "Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED", itemPrice: 999.99, imageURL: "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg"),
    ShopItem(id: 15, itemName: "BIYLACLESEN Women's 3-in-1 Snowboard Jacket Winter Coats", itemPrice: 56.99, imageURL: "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg"),
    ShopItem(id: 16, itemName: "Lock and Love Women's Removable Hooded Faux Leather Moto Biker Jacket", itemPrice: 29.95, imageURL: "https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg"),
    ShopItem(id: 17, itemName: "Rain Jacket Women Windbreaker Striped Climbing Raincoats", itemPrice: 39.99, imageURL: "https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg"),
    ShopItem(id: 18, itemName: "MBJ Women's Solid Short Sleeve Boat Neck V", itemPrice: 9.85, imageURL: "https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg"),
    ShopItem(id: 19, itemName: "Opna Women's Short Sleeve Moisture", itemPrice: 7.95, imageURL: "https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg"),
    ShopItem(id: 20, itemName: "DANVOUY Womens T Shirt Casual Cotton Short", itemPrice: 12.99, imageURL: "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg"),
  ];
}
