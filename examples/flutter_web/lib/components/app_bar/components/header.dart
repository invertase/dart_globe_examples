import 'dart:convert';
import 'dart:js' as js;
import 'package:flutter/material.dart';
import 'package:flutter_web/constants.dart';
import 'package:http/http.dart' as http;

class Header extends StatefulWidget {
  const Header({
    super.key,
  });

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String customerName = '';

  @override
  void initState() {
    super.initState();
    getName();
  }

  Future<void> getName() async {
    final url = Uri.https(
      backendBaseUrl,
      'roman',
    );
    final response =
        await http.get(url, headers: {'content-type': 'text/plain'});
    final name = response.body;
    setState(() {
      customerName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        js.context
            .callMethod('open', ['https://linkedin.com/in/roman-maydana']);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo.png'),
          const SizedBox(width: 10.0),
          Text(customerName),
        ],
      ),
    );
  }
}
