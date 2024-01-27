import 'package:ecommerce2/providers/cart_provider.dart';
import 'package:ecommerce2/providers/product_provider.dart';
import 'package:ecommerce2/widgets/subtitle_text.dart';
import 'package:ecommerce2/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartWidgetCheckOut extends StatelessWidget {
  const CartWidgetCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
        final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            border: const Border(top: BorderSide(width: 3,color: Colors.grey))
      ),
      child:  SizedBox(
        height: kBottomNavigationBarHeight + 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Flexible(
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(child: TitlesTextWidget(label: "Total(${cartProvider.getCartItems.length}Product/${cartProvider.getQty()}Items) ",fontSize: 17,)),
                     SubtitleTextWidget(
                      label: "${cartProvider.getTotal(productProvider: productProvider)}\$",
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              ElevatedButton(onPressed: ()  {}, child: const Text('Check out')),
            ],
          ),
        ),
      ),
    );
  }
}
