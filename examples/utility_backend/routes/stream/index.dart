import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:eventsource/publisher.dart';

import '../../helpers/eventsource.dart';

Future<Response> onRequest(RequestContext context) async {
  try {
    print('Started here');
    final publisher = EventSourcePublisher(cacheCapacity: 100);

    final handler = fromShelfHandler(
      eventSourceHandler(publisher),
    );
    print('Handler created');
    var counter = 0;
    print('Timer created');
    Timer.periodic(const Duration(seconds: 1), (timer) {
      publisher.add(
        Event(
          id: DateTime.now().toIso8601String(),
          event: 'ping',
          data: 'ping at ${DateTime.now()}',
        ),
      );
      counter++;
      if (counter == 10) {
        timer.cancel();
        publisher.closeAllChannels();
      }
    });
    print('Handler return');
    return handler(context);
  } catch (e) {
    print(e);
    return Response(
      body: 'An error occurred: $e',
      statusCode: HttpStatus.serviceUnavailable,
    );
  }
}
