// ignore_for_file: prefer_const_constructors, no_duplicate_case_values

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_to_unicorn/models/category_model.dart';
import 'package:zero_to_unicorn/models/models.dart';
import 'package:zero_to_unicorn/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error'),
        centerTitle: true,),
      ),
    );
  }
}
