import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'dart:developer' as developer;

debugPrint(Object? error, StackTrace? stackTrace) {
  developer.log(
    'Development Error: ',
    error: error,
    stackTrace: stackTrace,
  );
  print(error);
}

Response jsonResponse(Map<String, dynamic> body, {int statusCode = 200}) {
  return Response(
    statusCode,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );
}

Response notFoundResponse(String entityType) {
  return jsonResponse(
    {
      'message': '$entityType not found or ID is not provided',
      'status': 'error',
    },
    statusCode: 404,
  );
}

Response internalServerErrorResponse(e, s) {
  debugPrint(e, s);
  return jsonResponse(
    {
      'message': 'Internal Server Error',
      'status': 'error',
    },
    statusCode: 500,
  );
}

Response getList(Request request, List<dynamic> dataList) {
  try {
    final queryParams = request.url.queryParameters;
    final limit = int.tryParse(queryParams['limit'] ?? '') ?? 10;
    final skip = int.tryParse(queryParams['skip'] ?? '') ?? 0;

    final paginatedData = dataList.skip(skip).take(limit).toList();

    return jsonResponse({
      'data': paginatedData,
      'total': dataList.length,
      'limit': limit,
      'skip': skip,
    });
  } catch (e, s) {
    return internalServerErrorResponse(e, s);
  }
}

Response getItemById(
    Request request, List<dynamic> dataList, String entityType) {
  try {
    final id = request.params['id'];
    if (id == null || id.isEmpty) return notFoundResponse(entityType);

    final item = dataList.firstWhere(
      (obj) => obj['id'] == id,
      orElse: () =>
          <String, String>{}, // return an empty map if no item is found
    );
    if (item == null || item['id'] == null) return notFoundResponse(entityType);

    return jsonResponse(item);
  } catch (e, s) {
    return internalServerErrorResponse(e, s);
  }
}

Future<Response> addItem(
    Request request, List<dynamic> dataList, String entityType) async {
  try {
    final payload = await request.readAsString();
    final data = jsonDecode(payload);

    data['id'] = (dataList.length + 1).toString();
    dataList.add(data);

    return jsonResponse(
      {
        'message': '$entityType added successfully',
        'status': 'success',
      },
    );
  } catch (e, s) {
    return internalServerErrorResponse(e, s);
  }
}

Future<Response> updateItem(
    Request request, List<dynamic> dataList, String entityType) async {
  try {
    final id = request.params['id'];
    if (id == null || id.isEmpty) return notFoundResponse(entityType);

    final index = dataList.indexWhere((item) => item['id'] == id);
    if (index == -1) return notFoundResponse(entityType);

    final payload = await request.readAsString();
    final dataToUpdate = jsonDecode(payload);

    dataList[index] = dataToUpdate;

    return jsonResponse(
      {
        'message': '$entityType updated successfully',
        'status': 'success',
      },
    );
  } catch (e, s) {
    return internalServerErrorResponse(e, s);
  }
}

Response deleteItem(
    Request request, List<dynamic> dataList, String entityType) {
  try {
    final id = request.params['id'];
    if (id == null || id.isEmpty) return notFoundResponse(entityType);

    final index = dataList.indexWhere((item) => item['id'] == id);
    if (index == -1) return notFoundResponse(entityType);

    dataList.removeAt(index);

    return jsonResponse(
      {
        'message': '$entityType deleted successfully',
        'status': 'success',
      },
    );
  } catch (e, s) {
    return internalServerErrorResponse(e, s);
  }
}
