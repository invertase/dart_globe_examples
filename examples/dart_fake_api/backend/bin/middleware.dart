import 'package:shelf/shelf.dart';

import 'helpers.dart';

Middleware checkCountryHeaderAndSetLocale() {
  return (Handler innerHandler) {
    return (Request request) async {
      final countryHeader = request.headers['x-globe-country'];
      final queryParams = request.url.queryParameters;
      final locale = queryParams['locale'];
      setCustomLocale(locale ?? countryHeader ?? 'en');
      return innerHandler(request);
    };
  };
}
