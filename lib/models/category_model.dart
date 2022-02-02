// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(name: 'Soft Drinks', imageUrl: 'https://images.unsplash.com/photo-1551024709-8f23befc6f87?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGRyaW5rfGVufDB8fDB8fA%3D%3D&w=1000&q=80',),
    Category(name: 'Smoothies', imageUrl: 'https://images.unsplash.com/photo-1570696516188-ade861b84a49?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c21vb3RoaWV8ZW58MHx8MHx8&w=1000&q=80',),
    Category(name: 'Water', imageUrl: 'https://images.unsplash.com/photo-1589295926521-49b366c49767?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZHJvcHxlbnwwfDB8MHx8&ixlib=rb-1.2.1&w=1000&q=80',),

  ];
}