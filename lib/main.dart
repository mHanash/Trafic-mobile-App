import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafic_app/viewmodels/auth_viewmodel.dart';
import 'package:trafic_app/viewmodels/user_viewmodel.dart';
import 'package:trafic_app/views/Widgets/loader.dart';
import 'package:trafic_app/views/auth/login.dart';
import 'package:trafic_app/views/auth/register.dart';
import 'package:trafic_app/views/body.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (_) => AuthViewModel(),
        ),
        ChangeNotifierProvider<UserViewModel>(
          create: (_) => UserViewModel(),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        return FutureBuilder<bool>(
          future: authViewModel.getToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const MaterialApp(
                title: 'Trafic App',
                debugShowCheckedModeBanner: false,
                home: Loader(),
              );
            } else {
              if (snapshot.hasData && snapshot.data!) {
                return const MaterialApp(
                  title: 'Trafic App',
                  debugShowCheckedModeBanner: false,
                  home: Body(),
                );
              } else {
                return MaterialApp(
                  title: 'Trafic App',
                  debugShowCheckedModeBanner: false,
                  home: authViewModel.subscribe ? RegisterPage() : LoginPage(),
                );
              }
            }
          },
        );
      },
    );
  }
}
