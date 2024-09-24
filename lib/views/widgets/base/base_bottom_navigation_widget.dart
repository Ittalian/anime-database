import 'package:anime_database/views/widgets/base/base_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class BaseBottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTapSelected;

  const BaseBottomNavigationWidget(
      {super.key, required this.currentIndex, required this.onTapSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTapSelected,
      items: [
        const BaseBottomNavigationBarItem(icon: Icons.tv, label: 'アニメ一覧').generateItem(),
        const BaseBottomNavigationBarItem(icon: Icons.search, label: '検索').generateItem(),
      ],
    );
  }
}
