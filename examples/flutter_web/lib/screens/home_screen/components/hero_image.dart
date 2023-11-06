import 'package:flutter/material.dart';
import 'package:flutter_web/screens/home_screen/components/user_location_widget.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
    this.imageHeight = 380.0,
    this.circleRadius = 180.0,
    this.bottom = 50.0,
    this.imageWidth,
  });
  final double imageHeight;
  final double circleRadius;
  final double bottom;
  final double? imageWidth;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              radius: circleRadius,
              backgroundColor: Colors.deepOrange.shade400,
            ),
            Positioned(
              bottom: bottom,
              child: Image.asset(
                'assets/images/ramsai.png',
                height: imageHeight,
                width: imageWidth ?? mediaQuery.width * 0.25,
              ),
            ),
          ],
        ),
        const UserLocationWidget(),
      ],
    );
  }
}
