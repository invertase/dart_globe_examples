import 'package:flutter/material.dart';

import 'package:flutter_web/screens/home_screen/components/hero_image.dart';
import 'package:flutter_web/screens/home_screen/components/hero_text.dart';
import 'package:flutter_web/screens/home_screen/components/serving_items_list.dart';

class TabletHero extends StatelessWidget {
  const TabletHero({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Padding(
      // height: mediaQuery.height * 0.6,
      padding: EdgeInsets.symmetric(
          vertical: 20.0, horizontal: mediaQuery.width * 0.05),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: HeroText(),
                ),
                Expanded(
                  flex: 2,
                  child: HeroImage(),
                ),
              ],
            ),
            SizedBox(height: 50.0),
            SizedBox(
              height: 100.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: servingItems,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
