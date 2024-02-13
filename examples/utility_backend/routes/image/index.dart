import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.get) {
    return Response(statusCode: HttpStatus.methodNotAllowed);
  }

  return Response(
    headers: {
      'Content-Type': 'text/html',
    },
    body: '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Image Upload and Validation</title>
</head>
<body>

<h2>Upload an Image for Validation</h2>
<input type="file" id="imageInput" accept="image/*">
<button id="uploadButton">Upload and Validate</button>
<div id="response"></div>

<script>
    document.getElementById('uploadButton').addEventListener('click', function() {
        const input = document.getElementById('imageInput');
        const file = input.files[0];
        if (file) {
            // Prepare the form data
            const formData = new FormData();
            formData.append('image', file);

            // Send the request to the Dart Frog endpoint
            fetch('https://utility-backend.globeapp.dev/image/validate', {
                method: 'POST',
                body: formData,
            })
            .then(response => response.json())
            .then(data => {
                // Display the response
                document.getElementById('response').innerText = JSON.stringify(data, null, 2);
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('response').innerText = 'Failed to upload and validate the image.';
            });
        } else {
            alert('Please select an image file first.');
        }
    });
</script>

</body>
</html>

''',
  );
}
