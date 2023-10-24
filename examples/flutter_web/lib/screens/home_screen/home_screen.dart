import 'package:flutter/material.dart';
import 'package:flutter_web/components/components.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/screens/home_screen/components/hero_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: kBackgroundColor,
          child: const Column(
            children: [
              CustomNavbar(),
              Expanded(child: HeroContent()),
            ],
          ),
        ),
      ),
    );
  }
}
