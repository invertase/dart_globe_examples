import 'package:dart_frog/dart_frog.dart';

import '../middlewares/cors.dart';

Handler middleware(Handler handler) {
  return handler.use(corsHeaders() as Middleware);
}
