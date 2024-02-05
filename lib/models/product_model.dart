import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductModel with ChangeNotifier {
  List cart = [];
  double sum = 0;
  String? name;
  String? image;
  double? price;
  int? quantity;

  ProductModel({this.name, this.image, this.price, this.quantity});

  addProduct(name, image, double price, quantity, context) {
    // globalKey.currentState.insertItem(0);
    cart.add(ProductModel(
        name: name, image: image, price: price, quantity: quantity));
    this.sum = this.sum + (price * quantity);
    notifyListeners();
    // index = 3;
    // Navigator.of(context).pushReplacement(createRoute(BottomNavigation()));
    Get.snackbar("Added!", "Item added suucessfully",
        snackPosition: SnackPosition.BOTTOM);
  }

  removeProduct(i, quantity, price) {
    cart.remove(cart[i]);
    this.sum = this.sum - (price * quantity);
    notifyListeners();
  }
}
