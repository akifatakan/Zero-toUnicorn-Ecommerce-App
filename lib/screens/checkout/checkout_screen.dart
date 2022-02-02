// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_to_unicorn/blocs/checkout/checkout_bloc.dart';
import 'package:zero_to_unicorn/models/models.dart';
import 'package:zero_to_unicorn/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(email: value));}, context, 'Email'),
                  _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(fullName: value));}, context, 'Full Name'),
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(address: value));}, context, 'Adress'),
                  _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(city: value));}, context, 'City'),
                  _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(country: value));}, context, 'Country'),
                  _buildTextFormField((value){context.read<CheckoutBloc>().add(UpdateCheckout(zipCode: value));}, context, 'Zip Code'),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            'SELECT A PAYMENT METHOD',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,
                          color: Colors.white,),)
                      ],
                    ),
                  ),
                  Text(
                    'ORDER SUMMARY',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  OrderSummary(),
                ],
              );
            }
            else {return Text('Something went wrong');}
          },
        ),
      ),
    );
  }

  Padding _buildTextFormField(Function(String)? onChanged,
      BuildContext context, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child:
                Text(labelText, style: Theme.of(context).textTheme.bodyText1),
          ),
          Expanded(
              child: TextFormField(
                keyboardType: labelText == 'Email' ? TextInputType.emailAddress : null,
            onChanged: onChanged,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10.0),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
          )),
        ],
      ),
    );
  }
}
