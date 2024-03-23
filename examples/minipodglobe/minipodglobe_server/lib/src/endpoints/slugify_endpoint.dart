import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class SlugifyEndpoint extends Endpoint {
  Future<SlugifiedText> slugify(Session session, TextToSlugify payload) async {
    final slug = payload.text
        .trim()
        .toLowerCase()
        .replaceAll(' ', '-')
        .replaceAll(RegExp('[^a-z0-9-]+'), '');

    return SlugifiedText(slug: slug);
  }
}
