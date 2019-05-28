import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color highlightColor;
  final Color foregroundColor;

  LoginButton({this.onPressed, this.highlightColor, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 30.0),
      alignment: Alignment.center,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new FlatButton(
              padding: const EdgeInsets.symmetric(
                  vertical: 20.0, horizontal: 20.0
              ),
              color: highlightColor,
              onPressed: onPressed,
              child: Text(
                "Log In",
                style: TextStyle(color: foregroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

}