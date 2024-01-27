import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce2/consts/app_constant.dart';
import 'package:ecommerce2/providers/product_provider.dart';
import 'package:ecommerce2/services/assets_manager.dart';
import 'package:ecommerce2/widgets/app_name.dart';
import 'package:ecommerce2/widgets/product/ctg_rounded_widget.dart';
import 'package:ecommerce2/widgets/product/latest_arrival.dart';
import 'package:ecommerce2/widgets/title_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
        final productProvider = Provider.of<ProductProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppNameTextWidget(),
        leading: Image.asset(AssetsManager.shoppingCart),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.24,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        AppConstants.bannerImages[index],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: 2,
                    pagination: const SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: DotSwiperPaginationBuilder(
                            color: Colors.white, activeColor: Colors.red)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const TitlesTextWidget(label: ' latest arrival'),
              SizedBox(
                  height: size.height * 0.2,
                  child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                         return ChangeNotifierProvider.value(
                          value: productProvider.getProducts[index]
                        ,child: const LatestArrivalProductsWidget());
                      })),
              const TitlesTextWidget(label: ' Catergories'),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children:
                    List.generate(AppConstants.categoriesList.length, (index) {
                  return CatergorRoundedWidget(
                    image: AppConstants.categoriesList[index].image,
                    name: AppConstants.categoriesList[index].name,
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
