import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../helpers/error.dart';

Future<Response> onRequest(RequestContext context) async {
  return Response(
    statusCode: HttpStatus.notImplemented,
    body: const BackendError(
      message: 'To be implemented in the future',
      code: HttpStatus.notImplemented,
    ).toBody(),
  );
}
