import 'package:ecommerce2/screens/auth/login.dart';
import 'package:ecommerce2/screens/inner_screens/order/orders_screen.dart';
import 'package:ecommerce2/screens/inner_screens/viewed_recently.dart';
import 'package:ecommerce2/screens/inner_screens/whislist.dart';
import 'package:ecommerce2/widgets/app_name.dart';
import 'package:ecommerce2/widgets/subtitle_text.dart';
import 'package:ecommerce2/widgets/title_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../services/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
        appBar: AppBar(
          title: const AppNameTextWidget(),
          leading: Image.asset(AssetsManager.shoppingCart),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Visibility(
                visible: false,
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TitlesTextWidget(
                      label: "Please login to have ultimate access"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.background,
                            width: 3),
                        image: const DecorationImage(
                          image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__340.png",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitlesTextWidget(label: "Mohamed khaled"),
                        SubtitleTextWidget(label: "mohamedkhaled329@gmail.com"),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitlesTextWidget(label: "General"),
                    CustomListTile(
                      imagePath: AssetsManager.orderSvg,
                      text: "All orders",
                      function: ()async {
                        await Navigator.pushNamed(context, OrdersScreenFree.RoutName);

                      },
                    ),
                    CustomListTile(
                      imagePath: AssetsManager.wishlistSvg,
                      text: "Wishlist",
                      function: () async {
                        await Navigator.pushNamed(
                            context, WhislistScreen.RoutName);
                      },
                    ),
                    CustomListTile(
                      imagePath: AssetsManager.recent,
                      text: "Viewed recently",
                      function: () async {
                        await Navigator.pushNamed(
                            context, ViewedRecentlyScreen.RoutName);
                      },
                    ),
                    CustomListTile(
                      imagePath: AssetsManager.address,
                      text: "Address",
                      function: () {},
                    ),
                    const Divider(
                      height: 1.6,
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    const TitlesTextWidget(label: "Settings"),
                    const SizedBox(
                      height: 7,
                    ),
                    SwitchListTile(
                      secondary: Image.asset(
                        AssetsManager.theme,
                        height: 30,
                      ),
                      title: Text(themeProvider.getIsDarkTheme
                          ? "Dark mode"
                          : "Light mode"),
                      value: themeProvider.getIsDarkTheme,
                      onChanged: (value) {
                        themeProvider.setDarkTheme(themeValue: value);
                      },
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                  ),
                  onPressed: () /*async*/ {
                    /*await MyappMethods.showErrorORWarningDialog(
                        context: context,
                        subtitle: "Are You Sure ",
                        fct: () {
                        });*/
                          Navigator.pushNamed(context, LoginScreen.RoutName);

                  },
                  icon: const Icon(Icons.login),
                  label: const Text(
                    "Login",
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.function});
  final String imagePath, text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        function();
      },
      leading: Image.asset(
        imagePath,
        height: 30,
      ),
      title: SubtitleTextWidget(label: text),
      trailing: const Icon(IconlyLight.arrowRight2),
    );
  }
}
