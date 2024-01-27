
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ecommerce2/models/cart_model.dart';
import 'package:ecommerce2/providers/cart_provider.dart';
import 'package:ecommerce2/widgets/subtitle_text.dart';

class QuantityBottomSheetWidget extends StatelessWidget {
  const QuantityBottomSheetWidget({
    super.key,
    required this.cartModel,
  });
  final CartModel   cartModel;
  @override
  Widget build(BuildContext context) {
    
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 6,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: ListView.builder(
                //shrinkWrap: true,
                //physics: const  NeverScrollableScrollPhysics(),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return InkWell(onTap: (){
                    cartProvider.updateQuantity(productId: cartModel.productId, quantity: index + 1);
                  },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                          child: SubtitleTextWidget(label: '${index+1}')),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
