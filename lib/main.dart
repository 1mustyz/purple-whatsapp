// @dart=2.9
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:purple_whatsapp/screens/camera_screen.dart';
import 'package:purple_whatsapp/screens/home_screen.dart';

Future<void> main() async {
  // for camera plugin
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Purple whatsapp',
        theme: ThemeData(
            highlightColor: const Color.fromARGB(255, 193, 167, 230),
            fontFamily: "OpenSans",
            colorScheme: const ColorScheme.light(
                primary: Color(0xff6200ee),
                secondary: Color.fromARGB(255, 193, 167, 230))),
        home: HomeScreen());
  }
}
