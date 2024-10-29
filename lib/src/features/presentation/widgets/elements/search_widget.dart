import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String hintText;
  final Function(String)? onSearch;
  final TextEditingController? controller;

  const SearchWidget({
    super.key,
    this.hintText = "Search...",
    this.onSearch,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              offset: const Offset(0, 3), 
            ),
          ],
        ),
        child: TextField(
          style: const TextStyle(
          ),
          cursorColor: Colors.black,
          controller: controller,
          onChanged: onSearch,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          ),
        ),
      ),
    );
  }
}
