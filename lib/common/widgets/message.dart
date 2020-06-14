import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;

  Message({
    @required this.message,
  }) : assert(message != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/logo.png'),
          SizedBox(
            height: 50.0,
          ),
          Text(
            message,
            style: TextStyle(
              fontSize: 20.0,
              letterSpacing: 0.15,
              height: 1.15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
