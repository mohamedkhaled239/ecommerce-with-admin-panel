// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce2/providers/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class HeartBottomWidget extends StatefulWidget {
  const HeartBottomWidget(
      {super.key, this.size = 22, this.color = Colors.transparent, required this.productId});
  final Color? color;
  final double size;
  final String productId;

  @override
  State<HeartBottomWidget> createState() => _HeartBottomWidgetState();
}

class _HeartBottomWidgetState extends State<HeartBottomWidget> {
   
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
        ),
        child: IconButton(
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
            ),
            onPressed: () {
              wishlistProvider.addOrRemoveFromWishlist(productId: widget.productId);
            },
            
        icon: Icon(
          wishlistProvider.isProductInWishlist(productId: widget.productId)
              ? IconlyBold.heart
              : IconlyLight.heart,
          size: widget.size,
          color:
              wishlistProvider.isProductInWishlist(productId: widget.productId)
                  ? Colors.red
                  : Colors.grey,
        ),
      ),);
  }
}
