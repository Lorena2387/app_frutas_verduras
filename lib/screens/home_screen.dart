import 'package:app_frutas_verduras/inner_screen/on_sale_screen.dart';
import 'package:app_frutas_verduras/provider/dark_theme_provider.dart';
import 'package:app_frutas_verduras/services/global_methods.dart';
import 'package:app_frutas_verduras/services/utils.dart';
import 'package:app_frutas_verduras/widgets/feed_items.dart';
import 'package:app_frutas_verduras/widgets/on_sale_widget.dart';
import 'package:app_frutas_verduras/widgets/text_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offreImages = [
    'asset/offres/offre1.png',
    'asset/offres/offre2.png',
    'asset/offres/offre3.png',
    'asset/offres/offre4.png'
  ];
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = Utils(context).getScreenSize;
    GlobalMethods globalMethods = GlobalMethods();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    _offreImages[index],
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                itemCount: _offreImages.length,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.white, activeColor: Colors.red),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                globalMethods.navigateTo(
                    ctx: context, routeName: OnSaleScreen.routeName);
              },
              child: TextWidget(
                text: 'View all',
                maxLines: 1,
                color: Colors.blue,
                textSize: 20,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: 'On sale'.toUpperCase(),
                        color: Colors.orange,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.orange,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const OnSaleWidget();
                        }),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our products',
                    color: color,
                    textSize: 22,
                    isTitle: true,
                  ),
                  //const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: TextWidget(
                      text: 'Browse all',
                      maxLines: 1,
                      color: Colors.blue,
                      textSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                //crossAxisSpacing: 10,
                childAspectRatio: size.width / (size.width * 0.55),
                children: List.generate(4, (index) {
                  return const FeedsWidget();
                }))
          ],
        ),
      ),
    );
  }
}
