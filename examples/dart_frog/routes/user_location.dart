import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final headers = context.request.headers;
  final isEu = headers['x-globe-eu'];

  final reqLatitude = headers['x-globe-latitude'];
  final reqLongitude = headers['x-globe-longitude'];
  if (reqLatitude == null ||
      reqLatitude.isEmpty ||
      reqLongitude == null ||
      reqLongitude.isEmpty) {
    return Response.json(
      statusCode: 404,
      body: {
        "message": 'Unavailable data',
      },
    );
  }
  final reqCity = headers['x-globe-city'];
  final reqCountry = headers['x-globe-country'];
  final reqRegion = headers['x-globe-region'];
  final reqRegionCode = headers['x-globe-region-code'];
  final reqContinent = headers['x-globe-continent'];
  final reqTimezone = headers['x-globe-tz'];
  return Response.json(
    body: {
      "isEu": isEu,
      "latitude": reqLatitude,
      "longitude": reqLongitude,
      "city": reqCity,
      "country": reqCountry,
      "region": reqRegion,
      "regionCode": reqRegionCode,
      "continent": reqContinent,
      "timezone": reqTimezone,
    },
  );
}
