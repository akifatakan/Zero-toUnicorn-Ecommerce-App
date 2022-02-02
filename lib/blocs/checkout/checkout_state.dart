part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
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
  final Checkout checkout;

  CheckoutLoaded({
    this.fullName,
    this.email,
    this.country,
    this.city,
    this.products,
    this.deliveryFee,
    this.subtotal,
    this.zipCode,
    this.address,
    this.total
}): checkout = Checkout(fullName: fullName,
  email: email,
  country: country,
  city: city,
  products: products,
  deliveryFee: deliveryFee,
  subtotal: subtotal,
  zipCode: zipCode,
  address: address,
  total: total);


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
}