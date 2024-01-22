import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

import '../../helpers/error.dart';
import '../../helpers/logger.dart';

enum CsvType {
  json,
  xml,
}

/// This router handles requests to `/csv`.
///
/// You can pass a query parameter `type` to this endpoint.
/// The type is either `json` or `xml`. check [CsvType]
/// for the supported types.
/// example: `/csv?type=json&delimiter=,&firstRowIsHeader=true`
/// If no type is passed, the default is `json`, delimiter is `,`, and
/// firstRowIsHeader is `true`.
/// The body of the request should be the CSV data.
Future<Response> onRequest(RequestContext context) async {
  // Access the incoming request.
  final request = context.request;

  // Access the HTTP method.
  final method = request.method.value;

  if (method == 'POST') {
    return _handlePost(request);
  } else {
    return Response(
      statusCode: HttpStatus.methodNotAllowed,
      body: 'Method not allowed',
    );
  }
}

Future<Response> _handlePost(Request request) async {
  // Access the query parameters as a `Map<String, String>`.
  final params = request.uri.queryParameters;

  // Get the value for the key `type`.
  // Default to `json` if there is no query parameter.
  final type = params['type'] ?? CsvType.json.name;
  final delimiter = params['delimiter'] ?? ',';
  final firstRowIsHeader = params['firstRowIsHeader'] as bool? ?? true;

  final body = await request.body();

  if (type == CsvType.json.name) {
    return _handleJson(
      body: body,
      delimiter: delimiter,
      firstRowIsHeader: firstRowIsHeader,
    );
  } else if (type == CsvType.xml.name) {
    return _handleXml(body);
  } else {
    return Response(
      statusCode: HttpStatus.badRequest,
      body: const BackendError(
        message: 'Invalid type',
        code: HttpStatus.badRequest,
      ).toBody(),
    );
  }
}

Response _handleJson({
  required String body,
  required String delimiter,
  required bool firstRowIsHeader,
}) {
  try {
    // Split the CSV data into rows
    final rows = body.split('\n').where((row) => row.isNotEmpty).toList();
    // Check if the first row is the header
    if (firstRowIsHeader && rows.isNotEmpty) {
      // Extract headers
      final headers = rows.first.split(delimiter);

      // Process each row and convert it to a Map
      final jsonData = <Map<String, String>>[];
      for (final row in rows) {
        final values = row.split(delimiter);

        // Ensure each row has the correct number of columns
        if (values.length == headers.length) {
          final rowMap = Map<String, String>.fromIterables(headers, values);
          jsonData.add(rowMap);
        }
      }

      // Convert the List<Map> to a JSON string
      return Response(
        // Convert the List<Map> to a JSON string
        body: jsonEncode(jsonData),
      );
    } else {
      // Process each row and convert it to a List
      final jsonData = rows
          .map(
            (row) => row.split(delimiter),
          )
          .toList();

      // Convert the List<List<String>> to a JSON string
      return Response(
        // Convert the List<Map> to a JSON string
        body: jsonEncode(jsonData),
      );
    }
  } catch (e) {
    logger.e(e);
    return Response(
      statusCode: HttpStatus.badRequest,
      body: const BackendError(
        message: 'Invalid CSV data',
        code: HttpStatus.badRequest,
      ).toBody(),
    );
  }
}

Response _handleXml(String body) {
  return Response(
    statusCode: HttpStatus.badRequest,
    body: const BackendError(
      message: 'XML is not supported yet',
      code: HttpStatus.badRequest,
    ).toBody(),
  );
}
