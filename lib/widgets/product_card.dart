// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:zero_to_unicorn/blocs/cart/cart_bloc.dart';
import 'package:zero_to_unicorn/blocs/wishlist/wishlist_bloc.dart';
import 'package:zero_to_unicorn/models/models.dart';
import 'package:zero_to_unicorn/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.leftPosition = 5,
      this.isWishlist = false})
      : super(key: key);

  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: widthValue,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 60,
            left: leftPosition,
            child: Container(
              width: widthValue - 10 - leftPosition,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: leftPosition + 5,
            child: Container(
              width: widthValue - 20 - leftPosition,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<CartBloc>()
                                    .add(CartProductAdded(product));
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return CartDialog(product: product);
                                    });
                              },
                              icon: Icon(Icons.add_circle, color: Colors.white),
                            ),
                          );
                        } else {
                          return Text('Something went wrong');
                        }
                      },
                    ),
                    isWishlist
                        ? Expanded(
                            child: IconButton(
                              onPressed: () {
                                context
                                    .read<WishlistBloc>()
                                    .add(RemoveWishlistProduct(product));

                                final snackBar = SnackBar(
                                    content:
                                        Text('Removed from your Wishlist!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(Icons.delete, color: Colors.white),
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
