import 'package:ecommerce_app/src/features/presentation/widgets/components/search_widget.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 45),
        child: SearchWidget(),
      ),
    );
  }
}