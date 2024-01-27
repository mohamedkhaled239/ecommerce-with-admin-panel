import 'package:ecommerce2/models/cart_model.dart';
import 'package:ecommerce2/providers/cart_provider.dart';
import 'package:ecommerce2/providers/product_provider.dart';
import 'package:ecommerce2/screens/cart/quanity_buttom_sheet.dart';
import 'package:ecommerce2/widgets/product/heart_bottom.dart';
import 'package:ecommerce2/widgets/subtitle_text.dart';
import 'package:ecommerce2/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct =
        productProvider.findByProdId(cartModelProvider.productId);
            final cartProvider = Provider.of<CartProvider>(context);

    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  getCurrProduct!.productImage,
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: TitlesTextWidget(
                            label: getCurrProduct.productTitle,
                            maxLines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                cartProvider.removeOneItem(productId: getCurrProduct.productId);
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                             HeartBottomWidget(productId: getCurrProduct.productId,)
                          ],
                        ),
                      ],
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubtitleTextWidget(
                          label: "${getCurrProduct.productPrice}\$",
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                        const Spacer(),
                        OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.blue,
                            ),
                          ),
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16.0),
                                  topRight: Radius.circular(16.0),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return  QuantityBottomSheetWidget(cartModel: cartModelProvider,);
                              },
                            );
                          },
                          icon: const Icon(IconlyLight.arrowDown2),
                          label: Text("Qty: ${cartModelProvider.quantity} "),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
