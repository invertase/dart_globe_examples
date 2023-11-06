import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  return Response.json(
    statusCode: 400,
    body: {'message': 'Bad request. Try again '},
  );
}
