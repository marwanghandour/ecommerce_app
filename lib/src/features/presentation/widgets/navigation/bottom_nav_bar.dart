import 'package:flutter/material.dart';
import '../../../../core/utils/app_icons.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildIconButton(0, AppIcons.home, ),
          _buildIconButton(1, AppIcons.search, ),
          _buildIconButton(2, AppIcons.category,),
          _buildIconButton(3, AppIcons.profile,),
        ],
      ),
    );
  }

  Widget _buildIconButton(int index, IconData icon,) {
    return Flexible(
      child: IconButton(
        icon: Icon(
          icon,
          size: 20,
        ),
        onPressed: () => onItemTapped(index),
      ),
    );
  }
}
