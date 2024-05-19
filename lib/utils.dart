import 'package:firebase_core/firebase_core.dart';
import 'package:flutterapp/firebase_options.dart';
import 'package:flutterapp/services/auth_service.dart';
import 'package:flutterapp/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

Future<void> setUpFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> registerServices() async {
  final getIt = GetIt.instance;
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<NavigationService>(NavigationService());
}
