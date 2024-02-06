import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<HttpServer> run(
  Handler handler,
  InternetAddress ip,
  int port,
) {
  final cascade = Cascade().add(handler).add(catchAll);
  return serve(cascade.handler, ip, port);
}

Response catchAll(RequestContext context) => Response(body: 'Catch All');
