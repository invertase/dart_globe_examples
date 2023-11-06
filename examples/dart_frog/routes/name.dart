import 'package:dart_frog/dart_frog.dart';

/// Handle requests to /name
///
/// Read more about https://globe.dev/docs/getting-started
Response onRequest(RequestContext context) {
  const customerName = 'Juan Sanchez';

  return Response.json(
    body: {
      'name': customerName,
    },
  );
}
