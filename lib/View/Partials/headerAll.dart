import 'package:flutter/material.dart';

class HeaderSectionAll {
  AppBar getAppBar(
    String title,
  ) {
    return AppBar(
      backgroundColor: const Color(0xFF0D42A9),
      elevation: 0,
      title: Text(title),
      // actions: [
      //   IconButton(
      //       onPressed: (() => {print('test')}),
      //       icon: Icon(Icons.search_rounded))
      // ],
    );
  }
}
