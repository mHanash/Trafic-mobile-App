import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafic_app/helpers/colors.dart';
import 'package:trafic_app/viewmodels/passenger_viewmodel.dart';
import 'package:trafic_app/views/Partials/navbar.dart';
import 'package:trafic_app/views/pages/history.dart';
import 'package:trafic_app/views/pages/home.dart';
import 'package:trafic_app/views/pages/setting.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PassengerViewModel>(
          create: (_) => PassengerViewModel(),
        ),
        // Ajoute d'autres fournisseurs pour les autres view models si nécessaire
      ],
      child: Scaffold(
        backgroundColor: Color(primaryColor),
        body: Column(
          children: [
            NavbarSection(),
            Expanded(
              child: Container(
                child: [
                  HomePassager(),
                  // Planning(),
                  History(),
                  Setting(),
                ][_currentIndex],
              ),
            )
          ],
        ),
        bottomNavigationBar: bottomBarFunction(),
      ),
    );
  }

  Widget bottomBarFunction() {
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
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(30),
        //   topRight: Radius.circular(30),
        // ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedIconTheme: IconThemeData(color: const Color(dartBlueColor)),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: const Color(dartBlueColor),
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                label: 'Accueil',
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(secondaryColor).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.home_rounded,
                    size: 30,
                    // color: Color(dartBlueColor),
                  ),
                )),
            BottomNavigationBarItem(
              label: 'Historique',
              icon: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color(secondaryColor).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.history,
                  size: 30,
                ),
              ),
            ),
            // BottomNavigationBarItem(
            //   label: 'Historique',
            //   icon: Container(
            //     margin: const EdgeInsets.all(5),
            //     padding: const EdgeInsets.all(5),
            //     decoration: BoxDecoration(
            //         color: Color(secondaryColor).withOpacity(0.2),
            //         borderRadius: BorderRadius.circular(10)),
            //     child: const Icon(
            //       Icons.history,
            //       size: 30,
            //     ),
            //   ),
            // ),
            BottomNavigationBarItem(
                label: 'Paramètres',
                icon: Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(secondaryColor).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
