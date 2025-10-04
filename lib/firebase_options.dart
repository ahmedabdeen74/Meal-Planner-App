import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6cWsHAmm_76Lom5HA3dKX_zJyAQWuj5Y', // من google-services.json
    appId: '1:46879135766:android:c69f99795d0896504a7d37', // mobilesdk_app_id
    messagingSenderId: '46879135766', // project_number
    projectId: 'food-planner-app-3c478', // project_id
    storageBucket: 'food-planner-app-3c478.firebasestorage.app', // storage_bucket
  );
}
