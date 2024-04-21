import 'package:flutter/material.dart';
import 'utils.dart';
import 'pages/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  await setUp();
  runApp(const MyApp());
}

Future<void> setUp() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setUpFireBase();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      home: LoginScreen(),
    );
  }
}
