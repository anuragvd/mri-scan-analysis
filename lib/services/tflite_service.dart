import 'dart:typed_data';
import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class TFLiteService {
  late Interpreter _interpreter;
  bool _isModelLoaded = false;

  Future<void> loadModel() async {
    _interpreter = await Interpreter.fromAsset('assets/model.tflite');
    _isModelLoaded = true;
  }

  Future<String> classifyImage(File image) async {
    if (!_isModelLoaded) {
      throw Exception("Model not loaded. Call loadModel() first.");
    }

    var input = preprocessImage(image);
    var output = List.filled(2, 0.0).reshape([1, 2]); // Adjust based on model

    _interpreter.run(input, output);

    return output[0][0] > output[0][1] ? "MRI Scan: Normal" : "MRI Scan: Abnormal";
  }

  Float32List preprocessImage(File imageFile) {
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;
    image = img.copyResize(image, width: 224, height: 224);

    var convertedBytes = Float32List(224 * 224 * 3);
    
    for (int i = 0; i < 224; i++) {
      for (int j = 0; j < 224; j++) {
        int pixel = image.getPixel(j, i);

        int r = (pixel >> 16) & 0xFF; // Extract red channel
        int g = (pixel >> 8) & 0xFF;  // Extract green channel
        int b = (pixel) & 0xFF;       // Extract blue channel

        convertedBytes[(i * 224 + j) * 3 + 0] = r / 255.0;
        convertedBytes[(i * 224 + j) * 3 + 1] = g / 255.0;
        convertedBytes[(i * 224 + j) * 3 + 2] = b / 255.0;
      }
    }
    
    return convertedBytes;
  }
}
