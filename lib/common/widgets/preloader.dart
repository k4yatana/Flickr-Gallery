import 'package:flutter/material.dart';

class Preloader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        height: 25.0,
        width: 25.0,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
