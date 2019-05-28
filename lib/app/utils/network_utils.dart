import 'dart:convert';
import 'package:my_stock/app/models/User.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'auth_utils.dart';

class NetworkUtils {
  static final String host = productionHost;
  static final String productionHost = 'http://68.183.117.202';
  static final String developmentHost = 'http://192.168.43.44';

  static dynamic authenticateUser(String email, String password) async {
    var uri = host + AuthUtils.endPoint;

    try {
      final response =
          await http.post(uri, body: {'email': email, 'password': password});

      final responseJson = json.decode(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static logoutUser(BuildContext context, SharedPreferences prefs) {
    String authToken = AuthUtils.getAuthorization(prefs);

    prefs.setString(AuthUtils.authTokenKey, null);
    prefs.setString(AuthUtils.tokenType, null);

    fetch(authToken, '/api/v2/auth/logout');

    Navigator.of(context).pushReplacementNamed('/');
  }

  static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(message ?? 'You are offline'),
    ));
  }

  static fetch(var authToken, var endPoint) async {
    var uri = host + endPoint;

    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': authToken},
      );

      final responseJson = json.decode(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static fetchUser(var authToken) async {
    var uri = host + '/api/v2/user';

    try {
      final response = await http.get(
        uri,
        headers: {'Authorization': authToken},
      );

      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON
        return User.fromJson(json.decode(response.body));

      } else {
        return false;
      }
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic makePayment(String customer, String payment, String authToken) async {
    var uri = host + "/api/v2/pay";

    try {
      final response =
      await http.post(
          uri,
          headers: {'Authorization': authToken},
          body: {'WaterMeter': customer, 'Money': payment}
          );

      final responseJson = json.decode(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic makeBill(String index, String code, String authToken) async {
    var uri = host + "/api/v2/rolove";

    try {
      final response =
      await http.post(
          uri,
          headers: {'Authorization': authToken},
          body: {'counterNumber': code, 'index': index}
      );

      final responseJson = json.decode(response.body);
      return responseJson;
    } catch (exception) {
      print(exception);
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

}
