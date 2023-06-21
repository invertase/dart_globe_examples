import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  print('We have logs now on a preview branch');
  return Response(body: 'Welcome to Dart Frog running in Globe! And then lets deploy a preview of this change!');
}
