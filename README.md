# mri_scan_analysis
🌟 Key Features
🔹 AI-Based MRI Scan Analysis
Integrates a deep learning model (converted to TFLite) for image classification.
Supports brain tumor detection, abnormality classification, and severity assessment.
Uses Grad-CAM heatmaps for model explainability.'

🔹 Medical Image Handling
Supports DICOM (Digital Imaging and Communications in Medicine) format.
Users can upload scans from their device or capture images using the camera.
Image preprocessing ensures enhanced model accuracy.

🔹 User Authentication & Security
Firebase authentication with email/password login, Google Sign-In, and Apple Sign-In.
Ensures secure data storage and privacy compliance.

🔹 Data Visualization & Reporting
Displays classification results with confidence scores.
Generates PDF/CSV reports for doctors and medical professionals.
Allows exporting and sharing medical reports via email or cloud storage.

🔹 User History & Cloud Sync
Saves past scan results for easy access.
Cloud integration allows syncing scan history across devices.

🛠️ Tech Stack

Frontend (Flutter)
Flutter SDK (Cross-platform UI framework)
Material Design UI for smooth user experience
Dart programming language
Backend & AI Model
TensorFlow Lite (TFLite) for on-device machine learning
Firebase for authentication, cloud storage, and Firestore database
Deployment & Tools
Firebase Authentication & Firestore
TensorFlow Lite Model Converter
Xcode & Android Studio for iOS/Android development
