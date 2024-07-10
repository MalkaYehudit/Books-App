

// import 'package:books_app/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:books_app/models/book_model.dart';
import 'package:books_app/screen/login_screen.dart';
// import 'package:books_app/screen/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void toggleTheme(){
    setState(() {
      isDarkMode =!isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: LoginScreen(
        toggleTheme: toggleTheme,
        isDarkMode: isDarkMode,
      ),
    );
  }
}
List<Book> cart = [];

