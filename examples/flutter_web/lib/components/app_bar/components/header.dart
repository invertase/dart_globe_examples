import 'dart:convert';

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
  late final String? customerName;

  @override
  void initState() {
    super.initState();
    getName();
  }

  Future<void> getName() async {
    final url = Uri.https(
      backendBaseUrl,
      'name',
    );
    final response = await http.get(url);
    final jsonMap = jsonDecode(response.body);
    setState(() {
      customerName = jsonMap['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png'),
        const SizedBox(width: 10.0),
        if (customerName != null) Text(customerName!),
      ],
    );
  }
}
