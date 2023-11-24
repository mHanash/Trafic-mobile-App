import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafic_app/helpers/colors.dart';
import 'package:trafic_app/viewmodels/auth_viewmodel.dart';
import 'package:trafic_app/views/auth/register.dart';
import 'package:trafic_app/views/body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Color(whiteColor),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Connexion",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Color(primaryColor)),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                child: const Text(
                  textAlign: TextAlign.center,
                  "Veuillez voux connecter pour utiliser notre application",
                  style: TextStyle(
                    color: Color(dartBlueColor),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: 'Email',
                  hintStyle: const TextStyle(
                      color: Color(whiteColor), fontWeight: FontWeight.bold),
                  fillColor: const Color(primaryColor),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.mail,
                    size: 30,
                    color: Color(whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Mot de passe',
                  hintStyle: const TextStyle(
                      color: Color(whiteColor), fontWeight: FontWeight.bold),
                  fillColor: Color(primaryColor),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 30,
                    color: Color(whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (email.isNotEmpty && password.isNotEmpty) {
                    authViewModel.login(email, password);

                    print(
                        'Connexion réussie : Email: $email, Mot de passe: $password');
                  } else {
                    // Afficher un message d'erreur ou effectuer une autre action
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Erreur'),
                          content: const Text(
                            'Erreur de connexion : Veuillez remplir tous les champs',
                            style: TextStyle(color: Color(dartBlueColor)),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    print(
                        'Erreur de connexion : Veuillez remplir tous les champs');
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  minimumSize: const Size(double.infinity, 0.0),
                  backgroundColor: Color(secondaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Se connecter',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Color(whiteColor),
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterPage(),
                    ),
                  );
                  print("créer un compte");
                },
                child: Text(
                  'Créer un compte',
                  style: TextStyle(
                      color: Color(dartBlueColor),
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
