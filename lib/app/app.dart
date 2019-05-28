import 'package:flutter/material.dart';
import 'package:my_stock/app/pages/_login_page.dart';
import 'package:my_stock/app/routes.dart';

class MyStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MyStock',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Colors.blue.shade500,
          textSelectionColor: Colors.blue.shade500,
          buttonColor: Colors.blue.shade500,
          accentColor: Colors.blue.shade500,
          bottomAppBarColor: Colors.white
      ),
      home: new LoginPage(),
      routes: routes,
    );
  }
}