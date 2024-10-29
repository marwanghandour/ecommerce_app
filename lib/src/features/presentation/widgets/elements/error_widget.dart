import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessege});
  final String errMessege;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errMessege),

    );
  }
}