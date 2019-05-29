import 'package:flutter/material.dart';
import 'package:my_stock/app/pages/_login_page.dart';
import 'package:my_stock/app/pages/auth/dashboard_page.dart';
import 'package:my_stock/app/pages/auth/view_more.dart';

final routes = {
  HomePage.routeName: (BuildContext context) => new HomePage(),
  LoginPage.routeName: (BuildContext context) => new LoginPage(),
  ViewMore.routeName: (BuildContext context) => new ViewMore(),
};
