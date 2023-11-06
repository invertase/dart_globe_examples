import 'dart:convert';
import 'dart:js' as js;

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web/constants.dart';
import 'package:flutter_web/screens/home_screen/providers/get_data.dart';
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
        SizedBox(height: 10.0),
        MapButton(),
        //ErrorHandleWidget()
      ],
    );
  }
}

class ErrorHandleWidget extends StatelessWidget {
  const ErrorHandleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getError(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }

          final message = snapshot.data ?? 'default message';
          return Center(
              child: Text(
            message,
            style: const TextStyle(fontSize: 30),
          ));
        });
  }

  Future<String> getError() async {
    final uri = Uri.https(
      backendBaseUrl,
      'error',
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return 'Is success. Weird :D ';
    }

    return jsonDecode(response.body)['message'];
  }
}

class MapButton extends StatefulWidget {
  const MapButton({
    super.key,
  });

  @override
  State<MapButton> createState() => _MapButtonState();
}

class _MapButtonState extends State<MapButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getCoordinates,
      child: Container(
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
              'Open Map',
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
      ),
    );
  }

  void getCoordinates() async {
    final url = Uri.https(
      backendBaseUrl,
      'leonardin',
    );
    final response = await http.get(url);
    final jsonMap = jsonDecode(response.body);
    js.context.callMethod('open', [
      'https://www.google.com/maps/@${jsonMap['latitude']},${jsonMap['longitude']},13z?entry=ttu'
    ]);
    print(jsonMap);
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

class CappuccinoPrice extends ConsumerWidget {
  const CappuccinoPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(getDataProvider);

    return Builder(builder: (builder) {
      if (result.hasError) return const Text('Oh No!');

      if (result.isLoading) return CircularProgressIndicator();

      final (flag, symbol, requestId) = result.value!;
      print(flag);
      print(symbol);
      return Column(
        children: [
          AutoSizeText(
            '$symbol 8.60',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.w700,
              fontFamily: 'Santana',
            ),
          ),
          if (flag.isNotEmpty)
            Image.network(
              flag,
              height: 50,
              width: 50,
              errorBuilder: (b, o, s) {
                print(s);
                return const Text('Yeah not worked');
              },
            ),
          if (requestId.isNotEmpty)
            Text(
              requestId,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            )
        ],
      );
    });
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
