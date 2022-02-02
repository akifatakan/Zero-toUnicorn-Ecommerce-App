// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_to_unicorn/blocs/product/product_bloc.dart';
import 'package:zero_to_unicorn/models/category_model.dart';
import 'package:zero_to_unicorn/models/models.dart';
import 'package:zero_to_unicorn/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({
    Key? key,
    required this.category,
  }) : super(key: key);
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(screen: routeName,),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator());
          }
          if (state is ProductLoaded) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.15),
                itemCount: state.products
                    .where((product) => product.category == category.name)
                    .toList().length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: ProductCard(
                        product: state.products
                            .where((product) => product.category == category.name)
                            .toList()[index],
                        widthFactor: 2.2,
                      ));
                });
          }
          else {return Text('Something went wrong');}
        },
      ),

      //ProductCard(product: Product.products[0],),
    );
  }
}
