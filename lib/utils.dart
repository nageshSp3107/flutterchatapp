import 'package:firebase_core/firebase_core.dart';
import 'package:flutterapp/firebase_options.dart';

Future<void> setUpFireBase() async{
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
}