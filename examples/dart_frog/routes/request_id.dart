import 'package:dart_frog/dart_frog.dart';

import '../utils.dart';

/// Handle requests to /currency
///
/// Read more about Globe headers here
/// https://globe.dev/docs/infrastructure/headers
Response onRequest(RequestContext context) {
  const defaultCountry = 'US';
  const globeCountryHeader = 'x-globe-country';
  final globeCountry = context.request.headers.entries.singleWhere(
    (entry) => entry.key == globeCountryHeader,
    orElse: () => const MapEntry(globeCountryHeader, defaultCountry),
  );

  final country = globeCountry.value;
  final (flag, symbol) = countryToSymbolRecord(country);
  final requestId = context.request.headers['x-globe-request-id'] ?? 'no_id';

  return Response.json(
    body: {
      'symbol': symbol,
      'flag': flag,
      'requestId': requestId,
    },
  );
}
