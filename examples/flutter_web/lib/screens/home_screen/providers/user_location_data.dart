import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web/constants.dart';
import 'package:http/http.dart' as http;

sealed class UserLocationFailure implements Exception {}

class UnavailableUserLocationFailure extends UserLocationFailure {}

class UnexpectedUserLocationFailure extends UserLocationFailure {}

class UserLocation {
  const UserLocation({
    required this.latitude,
    required this.longitude,
    this.isEu,
    this.city,
    this.country,
    this.region,
    this.regionCode,
    this.continent,
    this.timezone,
  });

  final String latitude;
  final String longitude;
  final bool? isEu;
  final String? city;
  final String? country;
  final String? region;
  final String? regionCode;
  final String? continent;
  final String? timezone;

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    final rawIsEu = json['isEu'];
    final isEu = rawIsEu is bool ? rawIsEu : bool.tryParse(rawIsEu ?? '');
    return UserLocation(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      isEu: isEu,
      city: json['city'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      regionCode: json['regionCode'] as String?,
      continent: json['continent'] as String?,
      timezone: json['timezone'] as String?,
    );
  }
}

final userLocationDataProvider = AutoDisposeFutureProvider(
  (ref) async {
    try {
      final url = Uri.https(
        backendBaseUrl,
        'user_location',
      );
      final response = await http.get(url);
      if (response.statusCode == 404) throw UnavailableUserLocationFailure();
      if (response.statusCode != 200) throw UnexpectedUserLocationFailure();
      final jsonMap = jsonDecode(response.body) as Map<String, dynamic>;
      return UserLocation.fromJson(jsonMap);
    } on UserLocationFailure catch (_) {
      rethrow;
    } catch (e) {
      throw UnexpectedUserLocationFailure();
    }
  },
);
