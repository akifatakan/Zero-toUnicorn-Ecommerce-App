// ignore_for_file: prefer_const_constructors

import 'package:equatable/equatable.dart';
import 'package:zero_to_unicorn/models/product_model.dart';

class Cart extends Equatable{
  final List<Product> products;

  Map productsQuantity(products) {
    var quantity = Map();

    products.forEach((product) {
      if(!quantity.containsKey(product)) {
        quantity[product] = 1;
      }
      else {quantity[product] += 1;}
    });
    return quantity;
  }

  const Cart({this.products = const <Product>[]});

  double get subtotal => products.fold(0, (total, current) => total + current.price);
  String get subtotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);
  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);


  double deliveryFee(subtotal){
    if(subtotal >=30){
      return 0.0;
    } else {
      return 10.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 30.0){
      return 'You have FREE Delivery';
    }else{
      double missing = 30.0 - subtotal;
      return 'Add \$${missing.toStringAsFixed(2)} for FREE Delivery';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }
  

  @override
  List<Object?> get props => [products];

}