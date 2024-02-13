import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

import '../../helpers/multipart_transformer.dart';
import '../../helpers/validate_image.dart';

Future<Response> onRequest(RequestContext context) async {
  try {
    if (context.request.method != HttpMethod.post) {
      return Response(statusCode: HttpStatus.methodNotAllowed);
    }

    // Ensure the request's content-type is multipart/form-data
    if (!context.request.headers.keys.contains('content-type') ||
        !context.request.headers['content-type']!
            .contains('multipart/form-data')) {
      return Response(
        statusCode: HttpStatus.badRequest,
        body: 'Invalid content type, expected multipart/form-data',
      );
    }

    print('header multip part done');

    final file = await requestMultipartToImage(context.request);
    if (file == null) {
      return Response(
        statusCode: HttpStatus.unprocessableEntity,
        body: 'Invalid image file',
      );
    }

    final validationResponse = await FileValidator.image(file);

    if (validationResponse.validated) {
      return Response.json(
        body: {
          'status': 'success',
          'message': validationResponse.message,
        },
      );
    } else {
      return Response.json(
        statusCode: HttpStatus.unprocessableEntity,
        body: {
          'status': 'error',
          'message': validationResponse.message,
        },
      );
    }
  } catch (e) {
    return Response(
      body: 'An error occurred: $e',
      statusCode: HttpStatus.serviceUnavailable,
    );
  }
}
