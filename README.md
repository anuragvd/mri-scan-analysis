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



🔹 Firebase Features Used in the App
1️⃣ Firebase Authentication 🛡️
User Authentication with Email/Password, Google Sign-In, and Apple Sign-In.
Ensures secure login/logout for medical professionals and patients.
Session Management to keep users logged in.

2️⃣ Firebase Firestore (Cloud Database) 🗄️
Stores user scan history, AI predictions, and report metadata.
Allows real-time sync of MRI scan records across multiple devices.
Each scan entry includes:
User ID
MRI scan result
AI model confidence score
Timestamp

3️⃣ Firebase Cloud Storage ☁️
Used for storing uploaded MRI scan images.
Ensures HIPAA-compliant secure storage for medical records.
Images can be retrieved for further analysis.

4️⃣ Firebase Functions (Optional for Backend Processing) ⚙️
Can be used to preprocess MRI scans before passing them to the AI model.
Enables automated report generation and PDF creation.

5️⃣ Firebase Crashlytics & Analytics 📊
Monitors app performance, crashes, and errors in real-time.
Helps optimize user experience by tracking app usage.


📌 Firebase Workflow in the App
1️⃣ User logs in via Firebase Authentication.
2️⃣ Uploads MRI scan (stored in Firebase Cloud Storage).
3️⃣ AI model processes the image and stores the result in Firestore.
4️⃣ User retrieves past scans from Firestore history.
5️⃣ Report generation using Firebase Functions (if needed).

