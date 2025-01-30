# ModernVet Feedback Mobile Application

A mobile application for managing pet service feedback submissions.

## Environment Setup

### Prerequisites
- Flutter SDK (v3.0 or higher)
- Android Studio or Xcode (for emulator/simulator)
- Dart (comes with Flutter)

## Installation
1. Clone the repository
```bash
git clone https://github.com/muhnuryusri/modern_vet_frontend.git
cd modern_vet_frontend
```
3. Install dependencies:
```bash
flutter pub get
```

## Important Notes
- Ensure the backend server is running before using the app.
- Update the API base URL in the ``ApiClient`` (``api_client.dart``) to using your IP Address and port:
```bash
_dio.options.baseUrl = 'http://{your-api-address}:{port}/api';

#for example
_dio.options.baseUrl = 'http://192.168.56.1:3000/api';
```

## Run Project
1. Connect a device or start an emulator/simulator.
2. Run the app
```bash
flutter run
```
3. The app will launch on your device/emulator.
