// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;
  const CustomAppBar({
    Key? key,    required this.title

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white)
          ),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, '/wishlist');
        }, icon: Icon(Icons.favorite))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}