import 'package:dart_frog/dart_frog.dart';

/// Handle requests to /now
Response onRequest(RequestContext context) {
  return Response.json(
    body: {
      'now': DateTime.now(),
    },
  );
}
