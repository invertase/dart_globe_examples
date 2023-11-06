import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web/constants.dart';
import 'package:http/http.dart' as http;

final getDataProvider =
    FutureProvider.autoDispose<(String, String, String)>((ref) async {
  final url = Uri.https(
    backendBaseUrl,
    'request_id',
  );
  final response = await http.get(url);
  final jsonMap = jsonDecode(response.body);
  final flag = jsonMap['flag'] as String;
  final symbol = jsonMap['symbol'] as String;
  final requestId = jsonMap['requestId'] as String;
  return (flag, symbol, requestId);
});
