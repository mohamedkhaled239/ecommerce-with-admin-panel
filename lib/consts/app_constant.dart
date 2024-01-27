import 'package:ecommerce2/models/categories_model.dart';
import 'package:ecommerce2/services/assets_manager.dart';

class AppConstants {
   static List<String>bannerImages=[AssetsManager.banner1,AssetsManager.banner2,]; 
     static List<CategoriesModel>categoriesList=[
      CategoriesModel(id: AssetsManager.mobiles, name: 'Phones', image: AssetsManager.mobiles),
      CategoriesModel(id: AssetsManager.electronics, name: 'electronics', image: AssetsManager.electronics),
      CategoriesModel(id: AssetsManager.cosmetics, name: 'cosmetics', image: AssetsManager.cosmetics),
      CategoriesModel(id: AssetsManager.shoes, name: 'shoes', image: AssetsManager.shoes),
      CategoriesModel(id: AssetsManager.mobiles, name: 'watch', image: AssetsManager.watch),
      CategoriesModel(id: AssetsManager.mobiles, name: 'Laptop', image: AssetsManager.pc),
      CategoriesModel(id: AssetsManager.mobiles, name: 'clothes', image: AssetsManager.fashion),
      CategoriesModel(id: AssetsManager.mobiles, name: 'book', image: AssetsManager.book),

     ];
  static const String productImageUrl =
      'https://www.sportlandweb.it/133735-tm_thickbox_default/nike-air-winflo-10-rosa-foam-bianco-pearl-rosa-scarpe-running-donna.jpg';
}
