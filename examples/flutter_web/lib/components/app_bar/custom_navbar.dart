import 'package:flutter/material.dart';
import '../components.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 750) {
          return const DesktopNavbar();
        }
        return const MobileNavbar();
      }),
    );
  }
}
