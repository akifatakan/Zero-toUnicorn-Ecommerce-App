// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_to_unicorn/blocs/cart/cart_bloc.dart';
import 'package:zero_to_unicorn/blocs/checkout/checkout_bloc.dart';
import 'package:zero_to_unicorn/blocs/wishlist/wishlist_bloc.dart';
import 'package:zero_to_unicorn/models/models.dart';
import 'package:zero_to_unicorn/widgets/widgets.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    required this.screen,
    this.product,
    Key? key,
  }) : super(key: key);

  final String screen;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);

      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        icon: Icon(Icons.home),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        icon: Icon(Icons.shopping_cart),
        color: Colors.white,
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/user');
        },
        icon: Icon(Icons.person),
        color: Colors.white,
      ),
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      IconButton(
          onPressed: () {}, icon: Icon(Icons.share, color: Colors.white)),
      BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is WishlistLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is WishlistLoaded) {
          return IconButton(
              onPressed: () {
                context.read<WishlistBloc>().add(AddWishlistProduct(product));

                final snackBar =
                    SnackBar(content: Text('Added to your Wishlist!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(Icons.favorite, color: Colors.white));
        } else {
          return Text('Something went wrong');
        }
      }),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is CartLoaded) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                context.read<CartBloc>().add(CartProductAdded(product));
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return CartDialog(product: product);
                    });
              },
              child: Text(
                'ADD TO CART',
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          }
          return Text('Something went wrong');
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        child: Text(
          'GO TO CHECKOUT',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if(state is CheckoutLoaded) {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
              },
              child: Text(
                'ORDER NOW',
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          }
          if (state is CheckoutLoading) {
            return Center(child: CircularProgressIndicator());
          }
          else{return Text('Something went wrong');}
        },
      ),
    ];
  }
}
