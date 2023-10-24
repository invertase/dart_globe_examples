import 'package:flutter/material.dart';

import '../../components.dart';

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    const height = 100.0;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: width > 850 ? (width * 0.07) : (width * 0.05)),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Header(),
          const SizedBox(
            height: 30,
            child: NavbarItems(),
          ),

          //trailing
          if (width >= 1100)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SearchButton(),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: const Icon(
                    Icons.lock_outline,
                    color: Colors.black,
                    size: 25.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}
