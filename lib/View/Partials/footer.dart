import 'package:flutter/material.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10)
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: const Color(0xFF0D42A9),
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.home_rounded,
                      size: 30, color: Color(0xFF0D42A9)),
                )),
            BottomNavigationBarItem(
                label: 'Application',
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.more_horiz_outlined,
                      size: 30, color: Colors.grey),
                )),
            BottomNavigationBarItem(
                label: 'Film',
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.play_arrow_rounded,
                      size: 30, color: Colors.grey),
                )),
            BottomNavigationBarItem(
              label: 'Book',
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.auto_stories_rounded,
                    size: 30, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
