import 'package:flutter/material.dart';
class CustomCircleIndicator extends StatelessWidget {
  const CustomCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}