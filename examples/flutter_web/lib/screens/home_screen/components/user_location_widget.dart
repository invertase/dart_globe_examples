import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web/screens/home_screen/providers/user_location_data.dart';

class UserLocationWidget extends ConsumerWidget {
  const UserLocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userLocationDataProvider).when(
          data: (userLocation) =>
              AvailableUserLocation(userLocation: userLocation),
          error: (failure, _) => FailureUserLocation(
            failure: failure is UserLocationFailure
                ? failure
                : UnexpectedUserLocationFailure(),
          ),
          loading: () => const CircularProgressIndicator(),
        );
  }
}

class AvailableUserLocation extends StatelessWidget {
  const AvailableUserLocation({
    super.key,
    required this.userLocation,
  });

  final UserLocation userLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Location('Latitude', userLocation.latitude),
        _Location('Longitude', userLocation.longitude),
        if (userLocation.isEu != null)
          _Location('Is EU', '${userLocation.isEu}'),
        if (userLocation.city != null) _Location('City', userLocation.city!),
        if (userLocation.country != null)
          _Location('Country', userLocation.country!),
        if (userLocation.region != null)
          _Location('Region', userLocation.region!),
        if (userLocation.regionCode != null)
          _Location('Region Code', userLocation.regionCode!),
        if (userLocation.continent != null)
          _Location('Continent', userLocation.continent!),
        if (userLocation.timezone != null)
          _Location('Timezone', userLocation.timezone!),
      ],
    );
  }
}

class _Location extends StatelessWidget {
  const _Location(this.label, this.name);

  final String name;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        Text(name),
      ],
    );
  }
}

class FailureUserLocation extends StatelessWidget {
  const FailureUserLocation({
    super.key,
    required this.failure,
  });

  final UserLocationFailure failure;

  @override
  Widget build(BuildContext context) {
    return Text(switch (failure) {
      UnavailableUserLocationFailure() => 'User location is unavailable',
      UnexpectedUserLocationFailure() => 'Unexpected user location failure',
    });
  }
}
