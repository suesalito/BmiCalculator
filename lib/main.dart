import 'package:bmi_calculator/Screens/result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color((0xFF0A0E21)),
          //accentColor: Color(0xFFFA9191),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          //textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          })),
      //home: InputPage(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the Screen0 widget.
        '/': (context) => InputPage(),
        // When navigating to the "/first" route, build the Screen1 widget.
        '/first': (context) => ResultPage(),
      },
    );
  }
}
