import 'package:flutter/material.dart';
import 'package:zero_to_unicorn/models/models.dart';

class CartDialog extends StatelessWidget {
  const CartDialog({
    required this.product,
    Key? key,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment:
      MainAxisAlignment.spaceEvenly,
      content: Text(
        "${product.name} is added to cart",
        style: Theme.of(context)
            .textTheme
            .headline4,
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Continue"),
          style: ElevatedButton.styleFrom(
              primary: Colors.black),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(
                context, '/cart');
          },
          child: Text("Go to Cart"),
          style: ElevatedButton.styleFrom(
              primary: Colors.black),
        ),
      ],
    );
  }
}