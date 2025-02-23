import 'package:tflite_flutter/tflite_flutter.dart';
import 'firestore_service.dart';

class MRIAnalysisService {
  final FirestoreService _firestore = FirestoreService();

  Future<String> analyzeMRI(String imagePath) async {
    // Load TFLite Model
    final interpreter = await Interpreter.fromAsset('assets/model.tflite');

    // Process Image (Assuming image is preprocessed properly)
    // Run the model (dummy output for now)
    String result = "Possible Tumor Detected"; // Replace with actual prediction

    // Save to Firestore
    await _firestore.addSearchHistory(imagePath, result);

    return result;
  }
}

