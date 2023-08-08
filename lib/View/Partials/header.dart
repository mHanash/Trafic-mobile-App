import 'package:flutter/material.dart';

class HeaderSection {
  AppBar getAppBar(String title) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF0D42A9),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      centerTitle: false,
      leading: const Icon(
        Icons.tune_rounded,
        color: Colors.white,
      ),
    );
  }
}
