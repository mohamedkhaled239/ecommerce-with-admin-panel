import 'package:ecommerce2/screens/search_screen.dart';
import 'package:ecommerce2/widgets/title_text.dart';
import 'package:flutter/material.dart';

class CatergorRoundedWidget extends StatelessWidget {
  const CatergorRoundedWidget(
      {super.key, required this.image, required this.name});
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(
          context,
          SearchScreen.RoutName,
          arguments: name,
        );
      },
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
          ),
          TitlesTextWidget(
            label: name,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
