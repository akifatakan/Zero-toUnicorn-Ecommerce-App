// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zero_to_unicorn/blocs/cart/cart_bloc.dart';
import 'package:zero_to_unicorn/blocs/category/category_bloc.dart';
import 'package:zero_to_unicorn/blocs/checkout/checkout_bloc.dart';
import 'package:zero_to_unicorn/blocs/product/product_bloc.dart';
import 'package:zero_to_unicorn/blocs/wishlist/wishlist_bloc.dart';
import 'package:zero_to_unicorn/repositories/checkout/checkout_repository.dart';
import 'package:zero_to_unicorn/repositories/product/product_repository.dart';
import 'package:zero_to_unicorn/screens/screens.dart';
import 'package:zero_to_unicorn/simple_bloc_observer.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'package:zero_to_unicorn/repositories/category/category_repository.dart';
import 'widgets/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
            create: (_) =>
                CategoryBloc(categoryRepository: CategoryRepository())
                  ..add(LoadCategories())),
        BlocProvider(
            create: (_) => ProductBloc(productRepository: ProductRepository())
              ..add(LoadProducts())),
        BlocProvider(create: (context) => CheckoutBloc(cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository())),
      ],
      child: MaterialApp(
        title: 'Zero To Unicorn',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
