import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  const name = 'Martin Smith';

  return Response.json(
    body: {
      'name': name,
    },
  );
}
