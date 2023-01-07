import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class myTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(primarySwatch: Colors.pink,
      fontFamily: GoogleFonts.poppins().fontFamily,
       cardColor: Colors.white,
      canvasColor: creamColor,
      highlightColor:  darkcreamcolor,
      buttonColor: darkBluishColor,
      accentColor: darkBluishColor,

      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          ), toolbarTextStyle: Theme.of(context).textTheme.bodyText2, 
           titleTextStyle: Theme.of(context).textTheme.headline6,
      )
      // primaryTextTheme: GoogleFonts.latoTextTheme(),

      ); static ThemeData darkTheme(BuildContext context) => 
      ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      brightness: Brightness.dark,
      cardColor: darkBluishColor ,
      canvasColor: darkcreamcolor,
      highlightColor: textcolor,
      buttonColor: lightbluishcolor,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(
        color: Colors.white,
          ), toolbarTextStyle: Theme.of(context).textTheme.bodyText2, 
           titleTextStyle: Theme.of(context).textTheme.headline6,
      )
      );

      // colors 
      static Color creamColor = const Color(0xfff5f5f5);
      static Color darkBluishColor = const Color(0xff403b58);
      static Color darkcreamcolor = Vx.gray900;
      static Color lightbluishcolor = Vx.indigo600;
      static Color textcolor = Vx.black;
}