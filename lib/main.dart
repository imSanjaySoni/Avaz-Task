import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF009B72),
        scaffoldBackgroundColor: Color(0xFF2A2D34),
        dialogBackgroundColor: Color(0xFF2A2D34),
      ),
      home: HomeScreen(),
    );
  }
}
