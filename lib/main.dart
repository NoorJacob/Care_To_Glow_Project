import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:glow_guide_project/Screens/first_customization_screen.dart';
import 'package:glow_guide_project/Screens/sec_customization_screen.dart';
import 'package:glow_guide_project/firebase_options.dart';
import 'Screens/home_page_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
