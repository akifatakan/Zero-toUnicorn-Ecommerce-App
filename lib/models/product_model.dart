// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imageUrl: snap['imageUrl'],
      price: snap['price'],
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
    );
    return product;
  }

  static List<Product> products = [
    Product(name: 'Coca Cola', category: 'Soft Drinks', imageUrl: 'https://images.unsplash.com/photo-1594971475674-6a97f8fe8c2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y29rZXxlbnwwfHwwfHw%3D&w=1000&q=80',
        price: 2.99, isRecommended: false, isPopular: true),
    Product(name: 'Fanta Cola', category: 'Soft Drinks', imageUrl: 'https://media.istockphoto.com/photos/fanta-wiyh-orange-picture-id1356951526?b=1&k=20&m=1356951526&s=170667a&w=0&h=oeAFvJBVU4SrBlVnKcy_0ylMwmTSqdxqnuhXWVIGB9k=',
        price: 3.99, isRecommended: true, isPopular: false),
    Product(name: 'Sprite Cola', category: 'Soft Drinks', imageUrl: 'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3ByaXRlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 4.99, isRecommended: true, isPopular: true),
    Product(name: 'Strawberry Smoothie', category: 'Smoothies', imageUrl: 'https://media.istockphoto.com/photos/two-strawberry-banana-yogurt-smoothies-in-glasses-with-ingredients-picture-id483467404?b=1&k=20&m=483467404&s=170667a&w=0&h=MyiU9-dsVF7RsdnHDKSPTeX97Y8GgZ3d-BnRGWYSHwI=',
        price: 5.99, isRecommended: true, isPopular: false),
    Product(name: 'Chocolate Smoothie', category: 'Smoothies', imageUrl: 'https://images.unsplash.com/photo-1555411093-bb3d84291e2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGNob2NvbGF0ZSUyMHNtb290aGllfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 6.99, isRecommended: false, isPopular: true),
    Product(name: 'Milkshake', category: 'Soft Drinks', imageUrl: 'https://images.unsplash.com/photo-1594971475674-6a97f8fe8c2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Y29rZXxlbnwwfHwwfHw%3D&w=1000&q=80',
        price: 1.99, isRecommended: false, isPopular: true),
    Product(name: 'Lemonade', category: 'Soft Drinks', imageUrl: 'https://media.istockphoto.com/photos/fanta-wiyh-orange-picture-id1356951526?b=1&k=20&m=1356951526&s=170667a&w=0&h=oeAFvJBVU4SrBlVnKcy_0ylMwmTSqdxqnuhXWVIGB9k=',
        price: 10.99, isRecommended: true, isPopular: false),
    Product(name: 'Ice Tea', category: 'Soft Drinks', imageUrl: 'https://images.unsplash.com/photo-1625772299848-391b6a87d7b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c3ByaXRlfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 9.99, isRecommended: true, isPopular: true),
    Product(name: 'Strawberry Milk', category: 'Smoothies', imageUrl: 'https://media.istockphoto.com/photos/two-strawberry-banana-yogurt-smoothies-in-glasses-with-ingredients-picture-id483467404?b=1&k=20&m=483467404&s=170667a&w=0&h=MyiU9-dsVF7RsdnHDKSPTeX97Y8GgZ3d-BnRGWYSHwI=',
        price: 4.99, isRecommended: true, isPopular: false),
    Product(name: 'Chocolate Milk', category: 'Smoothies', imageUrl: 'https://images.unsplash.com/photo-1555411093-bb3d84291e2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGNob2NvbGF0ZSUyMHNtb290aGllfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        price: 8.99, isRecommended: false, isPopular: true),

  ];
}
