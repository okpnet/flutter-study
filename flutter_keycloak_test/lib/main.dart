import 'package:flutter/material.dart';
import 'package:teste/screens/auth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Keycloak',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        colorScheme:const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.grey,
          surface:Colors.black,
          background:Colors.black,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
        ),
        textTheme:const TextTheme(
          displayLarge: TextStyle(
            fontSize:48,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5
            ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400
          ),
        ),
        evatedButtonTheme: ElevatedButtonThemeData(
          style:EvetedButton.styleForm(
            backgroundColor:Colors.white,
            foregroundColor:Colors.black,
            elevation: 0,
            shpe:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(8),
            ),
          ),
        ),
        outlieButtonTheme:OutlineButtonThemeData(
          style:OutlineButton.styleForm(
            foregroundColor:Colors.white,
            side:const BorderSide(color:Colors.grey),
            shape:RoundRectangleBorder(
              borderRadius:BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: const AuthScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
