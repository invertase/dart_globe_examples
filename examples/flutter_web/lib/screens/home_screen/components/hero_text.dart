import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:http/http.dart' as http;

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CappuccinoTitle(),
        SizedBox(height: 40.0),
        AboutCappuccino(),
        SizedBox(height: 20.0),
        CappuccinoPrice(),
        SizedBox(height: 10.0),
        BuyNowButton(),
      ],
    );
  }
}

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Buy now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.navigate_next_rounded,
            color: Colors.deepOrangeAccent,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}

class CappuccinoPrice extends StatefulWidget {
  const CappuccinoPrice({
    super.key,
  });

  @override
  State<CappuccinoPrice> createState() => _CappuccinoPriceState();
}

class _CappuccinoPriceState extends State<CappuccinoPrice> {
  late final String? currency;

  @override
  void initState() {
    super.initState();
    getCurrency();
  }

  getCurrency() async {
    final url = Uri.https(
      backendBaseUrl,
      'currency',
    );
    final response = await http.get(url);
    final jsonMap = jsonDecode(response.body);
    setState(() {
      currency = jsonMap['currency'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      currency != null ? '$currency 8.60' : '',
      style: const TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
        fontFamily: 'Santana',
      ),
    );
  }
}

class AboutCappuccino extends StatelessWidget {
  const AboutCappuccino({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      'The Midnight Mint Mocha Frappuccino features extra dark cocoa blended with Frappuccino Roast coffee.',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    );
  }
}

class CappuccinoTitle extends StatelessWidget {
  const CappuccinoTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AutoSizeText(
      'Midnight\nFrappuccino',
      maxLines: 2,
      style: TextStyle(
        color: Colors.black,
        fontSize: 40.0,
        fontWeight: FontWeight.w900,
        fontFamily: 'Santana',
      ),
    );
  }
}
