import 'dart:io';
import 'dart:typed_data';
import 'package:dart_frog/dart_frog.dart';
import 'package:image/image.dart' as img;
import 'package:mime/mime.dart';

Future<img.Image?> requestMultipartToImage(Request request) async {
  // Ensure the request's content-type is multipart/form-data
  if (!request.headers.containsKey('multipart/form-data')) {
    throw const HttpException('Invalid content type');
  }

  // Get the boundary used in the request
  final boundary = request.headers['content-type']!.split('boundary=')[1];

  // Transform the request into a stream of MimeMultipart objects
  final transformer = MimeMultipartTransformer(boundary);
  final bodyStream = request.bytes();
  final parts = transformer.bind(bodyStream);

  // Process each part of the multipart form data
  await for (final part in parts) {
    // Get content disposition header
    final contentDisposition = part.headers['content-disposition'];
    if (contentDisposition != null) {
      final filenameExp = RegExp('filename="([^"]+)"');
      final match = filenameExp.firstMatch(contentDisposition);

      // If there's a filename, we assume it's a file part
      if (match != null && match.groupCount > 0) {
        // Collect bytes from the part stream
        final bytes = Uint8List.fromList(await collectBytes(part));

        // Use the image library to decode the image from bytes
        return img.decodeImage(bytes);
      }
    }
  }

  return null;
}

Future<List<int>> collectBytes(Stream<List<int>> stream) async {
  final bytes = <int>[];
  await for (final part in stream) {
    bytes.addAll(part);
  }
  return bytes;
}
