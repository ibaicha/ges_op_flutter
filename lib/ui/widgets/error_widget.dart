import 'package:flutter/material.dart';

class ErrorOpWidget extends StatelessWidget {
  const ErrorOpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something was wrong',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
