import 'package:flutter/material.dart';

import '../../components.dart';

class TabletNavbar extends StatelessWidget {
  const TabletNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: const Row(
        children: [
          SizedBox(height: 70.0, child: Header()),
          SizedBox(height: 50.0, child: NavbarItems()),
        ],
      ),
    );
  }
}
