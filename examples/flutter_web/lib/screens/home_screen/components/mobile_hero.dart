import 'package:flutter/material.dart';

import 'package:flutter_web/screens/home_screen/components/hero_image.dart';
import 'package:flutter_web/screens/home_screen/components/hero_text.dart';
import 'package:flutter_web/screens/home_screen/components/serving_items_list.dart';

class MobileHero extends StatelessWidget {
  const MobileHero({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            SizedBox(
              height: height * 0.6,
              child: HeroImage(
                circleRadius: width * 0.35,
                imageHeight: height * 0.6,
                imageWidth: width * 0.38,
                bottom: 50,
              ),
            ),
            const CappuccinoTitle(),
            const SizedBox(height: 20.0),
            const AboutCappuccino(),
            const SizedBox(height: 20.0),
            const BuyNowButton(),
            const SizedBox(height: 10.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Only At',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    // fontFamily: 'Santana',
                  ),
                ),
                SizedBox(width: 10.0),
                CappuccinoPrice(),
              ],
            ),
            const SizedBox(height: 20.0),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // childAspectRatio: 0,
                crossAxisCount: width ~/ 270,
                mainAxisExtent: 100.0,
              ),
              itemBuilder: (context, index) {
                return Center(child: servingItems[index]);
              },
              itemCount: servingItems.length,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
