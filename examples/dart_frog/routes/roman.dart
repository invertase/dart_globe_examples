import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

/// Handle requests to /name
///
/// Read more about https://globe.dev/docs/getting-started
Response onRequest(RequestContext context) {
  const customerName = 'Roman Maydana';
  // write a content type header text/plain to show the name in the browse
  final headers = {'content-type': 'text/plain'};

  return Response(
    headers: headers,
    body: customerName,
  );
}
