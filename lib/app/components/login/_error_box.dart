import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final bool isError;
  final String errorText;
  final Color foregroundColor;

  ErrorBox({this.isError, this.errorText, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    if(isError) {
      return new Container(
        padding: const EdgeInsets.only(top: 150.0, bottom: 50.0),
        child: Center(
          child: new Column(
            children: <Widget>[
              Container(
                height: 128.0,
                width: 128.0,
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
              new Padding(
                padding: const EdgeInsets.all(16.0),
                child: new Text(
                  errorText ?? '',
                  style: new TextStyle(color: Colors.red.shade500),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return new Container(
          padding: const EdgeInsets.only(top: 150.0, bottom: 50.0),
          child: Center(
            child: new Column(
              children: <Widget>[
                Container(
                  height: 128.0,
                  width: 128.0,
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
              ],
            ),
          )
      );
    }
  }

}