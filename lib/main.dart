import 'package:flutter/material.dart';
import 'package:flutter_practice_codepur/pages/Home_page.dart';
import 'package:flutter_practice_codepur/pages/Login_page.dart';
import 'package:flutter_practice_codepur/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Homepage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.pink,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.orange
      ),
      routes:{
        "/" :(context)=> Login_page(),
        Myroutes.Homeroutes :(context)=> Homepage(),
        Myroutes.Loginroutes :(context)=> Homepage(),

      }
    );
    
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(),
        ));
  }
}
