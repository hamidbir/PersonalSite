import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:site_demo/home/home_view.dart';

//! Start Programs
void main() {
  runApp(MyApp());
}

//* main Class: include Font program, theme program, and home view
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamid Ravanbod ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline2: GoogleFonts.montserrat(color: Colors.black),
          headline4: GoogleFonts.montserrat(color: Colors.black, fontSize: 30),
        ),
      ),
      home: HomeView(),
    );
  }
}
