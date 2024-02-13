import 'dart:io';
import 'package:image/image.dart' as img;

class FileValidator {
  static const maxImageWidth = 1200;
  static const maxImageHeight = 800;
  static const maxFileSizeBytes = 10 * 1024 * 1024; // 10MB
  static const allowedFormats = ['jpeg', 'png'];

  static Future<ValidationResponse> image(img.Image image) async {
    // 1. Get Image Dimensions
    final width = image.width;
    final height = image.height;

    if (width > maxImageWidth || height > maxImageHeight) {
      return ValidationResponse(
        validated: false,
        message: '''
Image exceeds maximum dimensions ($maxImageWidth x $maxImageHeight)
''',
      );
    }

    // 2. Check File Size
    final fileSize = await imageFile.length();
    if (fileSize > maxFileSizeBytes) {
      return ValidationResponse(
        validated: false,
        message: 'Image exceeds maximum file size (2MB)',
      );
    }

    // 3. Verify Format
    final format = imageFile.path.split('.').last.toLowerCase();
    if (!allowedFormats.contains(format)) {
      return ValidationResponse(
        validated: false,
        message: 'Invalid image format. Only JPEG and PNG allowed.',
      );
    }

    // Success: If all checks pass, proceed
    // with other actions signaling the image is valid
    return ValidationResponse(
      validated: true,
      message: 'Image validated',
    );
  }
}

/// Simple class to represent a structured validation Response
class ValidationResponse {
  ValidationResponse({
    required this.message,
    required this.validated,
  });

  final String message;
  final bool validated;
}
