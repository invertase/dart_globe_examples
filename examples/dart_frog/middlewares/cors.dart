import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart' as shelf;

/// Returns a [Middleware] that adds CORS headers to the response.
dynamic corsHeaders() => fromShelfMiddleware(
      shelf.corsHeaders(
        headers: {
          shelf.ACCESS_CONTROL_ALLOW_ORIGIN: '*',
        },
      ),
    );
