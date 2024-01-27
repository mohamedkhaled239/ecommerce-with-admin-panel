import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:ecommerce2/providers/viewed_prod_provider.dart';
import 'package:ecommerce2/screens/cart/buttom_chechout.dart';
import 'package:ecommerce2/services/assets_manager.dart';
import 'package:ecommerce2/widgets/empty_bag.dart';
import 'package:ecommerce2/widgets/product/product_widget%20.dart';
import 'package:ecommerce2/widgets/title_text.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ViewedRecentlyScreen extends StatelessWidget {
    ViewedRecentlyScreen({super.key});
    static const RoutName = '/ViewedRecentlyScreen';

  @override
  Widget build(BuildContext context) {
            final ViewedProvider = Provider.of<ViewedProdProvider>(context);

    return ViewedProvider.getviewedProdItems.isEmpty
        ? Scaffold(
           body: EmptyBagWidget(
              imagePath: AssetsManager.shoppingBasket,
              title: "Your Viewed recently is empty",
              subtitle:
                  'Looks like you didn\'t add anything yet to your cart \ngo ahead and start shopping now',
              buttonText: "Shop Now",
           ),
        )
        : Scaffold(bottomSheet: const CartWidgetCheckOut(),
            appBar: AppBar(
              title:  TitlesTextWidget(label: "Veiwed recently(${ViewedProvider.getviewedProdItems.length})"),
              leading: Image.asset(AssetsManager.shoppingCart),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_forever_rounded,size: 30,)),
              ],
            ),
            body:  DynamicHeightGridView(
              itemCount: ViewedProvider.getviewedProdItems.length,
              builder: ((context, index) {
                return  ProductWidget(productId: ViewedProvider.getviewedProdItems.values.toList()[index].productId,);
              }),
              crossAxisCount: 2,
            ),
          );
  }
}
