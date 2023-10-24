import 'package:flutter/material.dart';

import 'package:flutter_web/screens/home_screen/components/hero_image.dart';
import 'package:flutter_web/screens/home_screen/components/hero_text.dart';
import 'package:flutter_web/screens/home_screen/components/serving_items_list.dart';

class DesktopHero extends StatelessWidget {
  const DesktopHero({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: mediaQuery.width * 0.07,
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 75.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: HeroText(),
                ),
                Expanded(
                  flex: 2,
                  child: HeroImage(),
                ),
                Expanded(
                  child: _ServingItems(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ServingItems extends StatelessWidget {
  const _ServingItems();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return servingItems[index];
      },
      separatorBuilder: (context, _) {
        return const SizedBox(height: 40.0);
      },
      itemCount: servingItems.length,
      shrinkWrap: true,
    );
  }
}
