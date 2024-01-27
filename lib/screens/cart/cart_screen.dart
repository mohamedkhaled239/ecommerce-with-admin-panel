import 'package:ecommerce2/providers/cart_provider.dart';
import 'package:ecommerce2/screens/cart/buttom_chechout.dart';
import 'package:ecommerce2/screens/cart/cart_widget.dart';
import 'package:ecommerce2/services/assets_manager.dart';
import 'package:ecommerce2/services/my_app_method.dart';
import 'package:ecommerce2/widgets/empty_bag.dart';
import 'package:ecommerce2/widgets/title_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Your cart is empty",
              subtitle:
                  'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
              buttonText: "Shop Now",
            ),
          )
        : Scaffold(
            bottomSheet: const CartWidgetCheckOut(),
            appBar: AppBar(
              title: TitlesTextWidget(
                  label: "Cart ${cartProvider.getCartItems.length}"),
              leading: Image.asset(AssetsManager.shoppingCart),
              actions: [
                IconButton(
                    onPressed: () {
                      MyappMethods.showErrorORWarningDialog(
                          isError: false,
                          context: context,
                          subtitle: "Remove Items",
                          fct: () {
                            cartProvider.clearLocalCart();
                          });
                    },
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      size: 30,
                    )),
              ],
            ),
            body: ListView.builder(
                itemCount: cartProvider.getCartItems.length,
                itemBuilder: (context, index) {
                  return ChangeNotifierProvider.value(
                      value: cartProvider.getCartItems.values.toList()[index],
                      child: const CartWidget());
                }),
          );
  }
}
