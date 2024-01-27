import 'package:ecommerce2/consts/theme_data.dart';
import 'package:ecommerce2/providers/cart_provider.dart';
import 'package:ecommerce2/providers/product_provider.dart';
import 'package:ecommerce2/providers/theme_provider.dart';
import 'package:ecommerce2/providers/viewed_prod_provider.dart';
import 'package:ecommerce2/providers/wishlist_provider.dart';
import 'package:ecommerce2/screens/auth/forgot_password.dart';
import 'package:ecommerce2/screens/auth/login.dart';
import 'package:ecommerce2/screens/auth/register.dart';
import 'package:ecommerce2/screens/inner_screens/order/orders_screen.dart';
import 'package:ecommerce2/screens/inner_screens/product_details.dart';
import 'package:ecommerce2/screens/inner_screens/viewed_recently.dart';
import 'package:ecommerce2/screens/inner_screens/whislist.dart';
import 'package:ecommerce2/screens/search_screen.dart';
import 'package:ecommerce2/widgets/root_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context,snapshpt) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ThemeProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ProductProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => CartProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => WishlistProvider(),
            ),
            ChangeNotifierProvider(
              create: (_) => ViewedProdProvider(),
            ),
            
          ],
          child: Consumer<ThemeProvider>(builder: (
            context,
            themeProvider,
            child,
          ) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Shop Smart',
              theme: Styles.themeData(
                  isDarkTheme: themeProvider.getIsDarkTheme, context: context),
              home: const RootScreen(),
              // home: const RegisterScreen(),
              routes: {
                ProductDetails.RoutName: (context) => const ProductDetails(),
                WhislistScreen.RoutName: (context) => WhislistScreen(),
                ViewedRecentlyScreen.RoutName: (context) => ViewedRecentlyScreen(),
                RegisterScreen.RoutName: (context) => const RegisterScreen(),
                LoginScreen.RoutName: (context) => const LoginScreen(),
                OrdersScreenFree.RoutName: (context) => const OrdersScreenFree(),
                ForgotPasswordScreen.RoutName: (context) =>
                    const ForgotPasswordScreen(),
                SearchScreen.RoutName: (context) => const SearchScreen(),
              },
            );
          }),
        );
      }
    );
  }
}
