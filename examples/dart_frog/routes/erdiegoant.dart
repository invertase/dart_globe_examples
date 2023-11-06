import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  const requestIdKey = 'x-globe-request-id';
  const cityKey = 'x-globe-city';

  final requestId = context.request.headers.entries
      .singleWhere((entry) => entry.key == requestIdKey)
      .value;
  final city = context.request.headers.entries
      .singleWhere((entry) => entry.key == cityKey)
      .value;

  // Decode city name to utf8
  final encodedCity = utf8.decode(city.codeUnits);

  return Response.json(
    body: {
      'requestId': requestId,
      'city': encodedCity,
    },
  );
}
