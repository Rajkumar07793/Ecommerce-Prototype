import 'package:flutter/material.dart';

class OrderedModel with ChangeNotifier {
  List orders = [];
  double? sum = 0;
  String? name;
  String? image;
  double? price;
  int? qty;
  List products = [];

  OrderedModel({this.name, this.image, this.price, this.qty, this.sum});

  addOrder(List cart, double sum, context) {
    for (int i = 0; i < cart.length; i++)
      products.add(OrderedModel(
        name: cart[i].name,
        image: cart[i].image,
        price: cart[i].price,
        qty: cart[i].quantity,
        sum: sum,
      ));
    orders.add(products);
    // this.sum = this.sum + (price * quantity);
    notifyListeners();
    // index = 3;
    // Navigator.of(context).pushReplacement(createRoute(BottomNavigation()));
    // products.clear();
  }

  // removeProduct(i, quantity, price) {
  //   cart.remove(cart[i]);
  //   this.sum = this.sum - (price * quantity);
  //   notifyListeners();
  // }
}
