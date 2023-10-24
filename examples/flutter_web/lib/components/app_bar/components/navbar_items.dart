import 'package:flutter/material.dart';

// navbar_items
final navbarItems = ["Trending", "Rewards", "Gift Cards", "Delivery"];

class NavbarItems extends StatelessWidget {
  const NavbarItems({
    super.key,
    this.isMobile = false,
  });
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: isMobile ? Axis.vertical : Axis.horizontal,
      itemBuilder: (context, index) {
        return NavbarItem(title: navbarItems[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 30.0);
      },
      shrinkWrap: true,
      itemCount: navbarItems.length,
    );
  }
}

class NavbarItem extends StatelessWidget {
  const NavbarItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
    );
  }
}
