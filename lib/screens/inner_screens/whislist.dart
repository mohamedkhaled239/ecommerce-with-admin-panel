import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce2/providers/wishlist_provider.dart';
import 'package:ecommerce2/screens/cart/buttom_chechout.dart';
import 'package:ecommerce2/services/assets_manager.dart';
import 'package:ecommerce2/services/my_app_method.dart';
import 'package:ecommerce2/widgets/empty_bag.dart';
import 'package:ecommerce2/widgets/product/product_widget%20.dart';
import 'package:ecommerce2/widgets/title_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WhislistScreen extends StatelessWidget {
  WhislistScreen({super.key});
  static const RoutName = '/WhislistScreen';

  bool isEmpty = false;
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return wishlistProvider.getWishlistItems.isEmpty
        ? Scaffold(
            body: EmptyBagWidget(
              imagePath: AssetsManager.bagWish,
              title: "Your wishlist is empty",
              subtitle:
                  'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
              buttonText: "Shop Now",
            ),
          )
        : Scaffold(
            bottomSheet: const CartWidgetCheckOut(),
            appBar: AppBar(
              title: TitlesTextWidget(
                  label:
                      "Wishlist(${wishlistProvider.getWishlistItems.length})"),
              leading: Image.asset(AssetsManager.shoppingCart),
              actions: [
                IconButton(
                    onPressed: () {
                      MyappMethods.showErrorORWarningDialog(
                          isError: false,
                          context: context,
                          subtitle: "Remove Items",
                          fct: () {
                            wishlistProvider.clearLocalWishlist();
                          });
                    },
                    icon: const Icon(
                      Icons.delete_forever_rounded,
                      size: 30,
                    )),
              ],
            ),
            body: DynamicHeightGridView(
              itemCount: wishlistProvider.getWishlistItems.length,
              builder: ((context, index) {
                return ProductWidget(
                  productId: wishlistProvider.getWishlistItems.values
                      .toList()[index]
                      .productId,
                );
              }),
              crossAxisCount: 2,
            ),
          );
  }
}
