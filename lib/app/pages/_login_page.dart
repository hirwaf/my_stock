import 'dart:async';

import 'package:my_stock/app/components/login/_email_field.dart';
import 'package:my_stock/app/components/login/_error_box.dart';
import 'package:my_stock/app/components/login/_login_button.dart';
import 'package:my_stock/app/components/login/_password_field.dart';
import 'package:my_stock/app/pages/auth/dashboard_page.dart';
import 'package:my_stock/app/utils/auth_utils.dart';
import 'package:my_stock/app/utils/network_utils.dart';
import 'package:my_stock/app/validations/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = 'login';
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //Login layout Colors
  final Color backgroundColor1 = Colors.lightGreenAccent;
  final Color backgroundColor2 = Color(0xFF6f6c7d);
  final Color highlightColor = Colors.green;
  final Color foregroundColor = Colors.white;
  final AssetImage logo = new AssetImage("assets/images/full-bloom.png");
  //
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SharedPreferences _sharedPreferences;
  bool _isError = false;
  bool _obscureText = true;
  bool _isLoading = false;
  TextEditingController _emailController, _passwordController;
  String _errorText, _emailError, _passwordError;

  @override
  void initState() {
    super.initState();
    _fetchSessionAndNavigate();
    _emailController = new TextEditingController();
    _passwordController = new TextEditingController();
  }

  _fetchSessionAndNavigate() async {
    _sharedPreferences = await _prefs;
    String authToken = AuthUtils.getToken(_sharedPreferences);
    if (authToken != null) {
      Navigator.of(_scaffoldKey.currentContext)
          .pushReplacementNamed(HomePage.routeName);
    }
  }

  _showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  _hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  _authenticateUser() async {
    _showLoading();
    if (_valid()) {
//      var responseJson = await NetworkUtils.authenticateUser(
//          _emailController.text, _passwordController.text);
//
//      if (responseJson == null) {
//        NetworkUtils.showSnackBar(_scaffoldKey, 'Something went wrong!');
//      } else if (responseJson == 'NetworkError') {
//        NetworkUtils.showSnackBar(_scaffoldKey, null);
//      } else if (responseJson['errors'] != null) {
//        NetworkUtils.showSnackBar(_scaffoldKey, 'Invalid Email/Password');
//      } else if (responseJson['message'] != null) {
//        NetworkUtils.showSnackBar(_scaffoldKey, responseJson['message']);
//      } else {
//        AuthUtils.insertDetails(_sharedPreferences, responseJson);
//        /**
//         * Removes stack and start with the new page.
//         * In this case on press back on HomePage app will exit.
//         * **/
//        Navigator.of(_scaffoldKey.currentContext)
//            .pushReplacementNamed(HomePage.routeName);
//      }
      Navigator.of(_scaffoldKey.currentContext)
          .pushReplacementNamed(HomePage.routeName);

      _hideLoading();
    } else {
      setState(() {
        _isLoading = false;
        _emailError;
        _passwordError;
      });
    }
  }

  _valid() {
    bool valid = true;

    if (_emailController.text.isEmpty) {
      valid = false;
      _emailError = "Email can't be blank!";
    } else if (!_emailController.text.contains(EmailValidator.regex)) {
      valid = false;
      _emailError = "Enter valid email!";
    }

    if (_passwordController.text.isEmpty) {
      valid = false;
      _passwordError = "Password can't be blank!";
    } else if (_passwordController.text.length < 6) {
      valid = false;
      _passwordError = "Password is invalid!";
    }

    return valid;
  }

  Widget _loginScreen() {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.centerLeft,
          end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
          colors: [this.backgroundColor1, this.backgroundColor2], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
//        image: new DecorationImage(
//          image: logo,
//          fit: BoxFit.cover,
//        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          new ErrorBox(
              isError: _isError,
              errorText: _errorText,
              foregroundColor: foregroundColor
          ),
          new EmailField(
              emailController: _emailController,
              emailError: _emailError,
              foregroundColor: foregroundColor
          ),
          new PasswordField(
            passwordController: _passwordController,
            obscureText: _obscureText,
            passwordError: _passwordError,
            togglePassword: _togglePassword,
            foregroundColor: foregroundColor,
          ),
          new LoginButton(
            onPressed: _authenticateUser,
            highlightColor: highlightColor,
            foregroundColor: foregroundColor,
          )
        ],
      ),
    );
  }

  _togglePassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Widget _loadingScreen() {
    return new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            begin: Alignment.centerLeft,
            end: new Alignment(1.0, 0.0), // 10% of the width, so there are ten blinds.
            colors: [Colors.white, Colors.white], // whitish to gray
            tileMode: TileMode.repeated, // repeats the gradient over the canvas
          ),
          image: new DecorationImage(
            image: logo,
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 150.0),
        child: new Center(
            child: new Column(
              children: <Widget>[
                new Container(
                  height: 128.0,
                  width: 128.0,
                  margin: const EdgeInsets.only(bottom: 50.0),
                  child: new CircleAvatar(
                    backgroundColor: Colors.transparent,
                    foregroundColor: foregroundColor,
                    radius: 100.0,
                    child: Image.asset('assets/images/ic_launcher.png'),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: foregroundColor,
                      width: 1.0,
                    ),
                    shape: BoxShape.circle,
                    //image: DecorationImage(image: this.logo)
                  ),
                ),
                new Theme(
                    data: Theme.of(context).copyWith(accentColor: Colors.blueAccent),
                    child: CircularProgressIndicator(strokeWidth: 4.0)
                ),
                new Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  child: new Text(
                    'Please Wait, checking ...',
                    style: new TextStyle(color: Colors.blueGrey, fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: _isLoading ? _loadingScreen() : _loginScreen(),
        ),
    );
  }
}
