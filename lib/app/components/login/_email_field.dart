import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  final String emailError;
  final Color foregroundColor;

  EmailField({this.emailController, this.emailError, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: foregroundColor,
              width: 0.5,
              style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
            padding:
            EdgeInsets.only(top: 10.0, bottom: 10.0, right: 05.0),
            child: Icon(
              Icons.alternate_email,
              color: foregroundColor,
            ),
          ),
          new Expanded(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
//              textAlign: TextAlign.center,
              style: new TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'example@example.com',
                errorText: emailError,
                labelText: 'Email',
                hintStyle: TextStyle(color: foregroundColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
