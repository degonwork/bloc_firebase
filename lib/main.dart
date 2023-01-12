import 'package:bloc_firebase/blocs/auth/auth_bloc.dart';
import 'package:bloc_firebase/blocs/cart/cart_bloc.dart';
import 'package:bloc_firebase/blocs/category/category_bloc.dart';
import 'package:bloc_firebase/blocs/checkout/checkout_bloc.dart';
import 'package:bloc_firebase/blocs/payment/payment_bloc.dart';
import 'package:bloc_firebase/blocs/product/product_bloc.dart';
import 'package:bloc_firebase/blocs/wishlist/wishlist_bloc.dart';
import 'package:bloc_firebase/repositories/auth/auth_repo.dart';
import 'package:bloc_firebase/repositories/category/category_repo.dart';
import 'package:bloc_firebase/repositories/checkout/checkout_repo.dart';
import 'package:bloc_firebase/repositories/local_storage/local_storage_repo.dart';
import 'package:bloc_firebase/repositories/product/product_repo.dart';
import 'package:bloc_firebase/repositories/user/user_repo.dart';
import 'package:bloc_firebase/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/app_router.dart';
import 'config/theme.dart';
import 'models/product_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  // Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepo()),
        RepositoryProvider(create: (context) => UserRepo()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepo: context.read<AuthRepo>())),
          BlocProvider(
              create: (_) => WishlistBloc(localStorageRepo: LocalStorageRepo())
                ..add(StartWishList())),
          BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
          BlocProvider(create: (_) => PaymentBloc()..add(LoadPaymentMethod())),
          BlocProvider(
              create: (context) => CheckoutBloc(
                    cartBloc: context.read<CartBloc>(),
                    checkoutRepo: CheckoutRepo(),
                    paymentBloc: context.read<PaymentBloc>(),
                  )),
          BlocProvider(
              create: (_) => CategoryBloc(categoryRepo: CategoryRepo())
                ..add(LoadCategories())),
          BlocProvider(
              create: (_) => ProductBloc(
                    productRepo: ProductRepo(),
                  )..add(LoadProducts())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
