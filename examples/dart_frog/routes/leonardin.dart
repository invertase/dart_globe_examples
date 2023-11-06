import 'package:dart_frog/dart_frog.dart';

import '../utils.dart';

/// Handle requests to /currency
///
/// Read more about Globe headers here
/// https://globe.dev/docs/infrastructure/headers
Response onRequest(RequestContext context) {

  const defaultLat = '0';
  const defaultLon = '0';

  const globeLatitudeHeader = 'x-globe-latitude';
  final globeLatitude = context.request.headers.entries.singleWhere(
    (entry) => entry.key == globeLatitudeHeader,
    orElse: () => const MapEntry(globeLatitudeHeader, defaultLat),
  );
  const globeLongitudeHeader = 'x-globe-longitude';
  final globeLongitude = context.request.headers.entries.singleWhere(
    (entry) => entry.key == globeLongitudeHeader,
    orElse: () => const MapEntry(globeLatitudeHeader, defaultLon),
  );
   return Response.json(
    body: {
      'latitude': globeLatitude.value,
      'longitude': globeLongitude.value,
    },
  );
}
