import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool obscureText;
  final String passwordError;
  final VoidCallback togglePassword;
  final Color foregroundColor;

  PasswordField(
      {this.passwordController,
      this.obscureText,
      this.passwordError,
      this.togglePassword,
      this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: foregroundColor, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 05.0),
            child: Icon(
              Icons.lock_open,
              color: foregroundColor,
            ),
          ),
          new Expanded(
            child: TextField(
                controller: passwordController,
                obscureText: obscureText,
//              textAlign: TextAlign.center,
                cursorColor: Colors.white,
                style: new TextStyle(color: Colors.white),
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    errorText: passwordError,
                    labelText: 'Password',
                    border: InputBorder.none,
                    hintText: '*********',
                    hintStyle: TextStyle(color: foregroundColor),
                    suffixIcon: new GestureDetector(
                      onTap: togglePassword,
                      child: new Icon(Icons.remove_red_eye),
                    ))),
          ),
        ],
      ),
    );
  }
}
