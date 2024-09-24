import 'package:flutter/material.dart';

class BaseBottomNavigationBarItem {
  final IconData icon;
  final String label;
  const BaseBottomNavigationBarItem({required this.icon, required this.label});

  BottomNavigationBarItem generateItem() {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
