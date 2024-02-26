import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import '../helpers/logger.dart';

Response onRequest(RequestContext context) {
  logger.d('We have logs now');
  final testToken = Platform.environment['API_TOKEN'];
  return Response(
    body: 'Welcome to Dart Frog running in Globe! $testToken',
  );
}
