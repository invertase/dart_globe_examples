import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'middleware.dart';
import 'router.dart';

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // optionally override default headers
  final overrideHeaders = {
    ACCESS_CONTROL_ALLOW_ORIGIN: '*',
  };
  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(corsHeaders(headers: overrideHeaders))
      .addMiddleware(checkCountryHeaderAndSetLocale())
      .addHandler(router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  final server = await serve(handler, ip, port);

  print('Server listening on port ${server.port}');
}
