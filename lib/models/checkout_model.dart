import 'package:equatable/equatable.dart';
import 'package:zero_to_unicorn/models/models.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final List<Product>? products;

  Checkout(
      {required this.fullName,
      required this.email,
      required this.address,
      required this.subtotal,
      required this.deliveryFee,
      required this.city,
      required this.country,
      required this.total,
      required this.zipCode,
      required this.products});

  @override
  List<Object?> get props => [
        fullName,
        email,
        city,
        country,
        zipCode,
        address,
        subtotal,
        deliveryFee,
        total,
        products
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map ();
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress' : customerAddress,
      'customerName' : fullName!,
      'customerEmail': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'total': total!,
      'deliverFee': deliveryFee!
    };
  }

}
