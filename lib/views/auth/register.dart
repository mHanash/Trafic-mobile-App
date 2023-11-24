import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:trafic_app/helpers/colors.dart';
import 'package:trafic_app/viewmodels/auth_viewmodel.dart';
import 'package:trafic_app/views/auth/login.dart';
import 'package:trafic_app/views/body.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernamedController = TextEditingController();
  final TextEditingController otherController = TextEditingController();
  bool _isVehicule = false;

  void _register() {
    String email = emailController.text;
    String password = passwordController.text;
    String username = usernamedController.text;
    String other = otherController.text;

    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    // Logique de connexion ici

    // Exemple de validation basique
    if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
      print('Connexion réussie : Email: $email, Mot de passe: $password');
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
      print('Erreur de connexion : Veuillez remplir tous les champs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(whiteColor),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Créer un compte",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Color(primaryColor)),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  ToggleSwitch(
                    onToggle: (index) {
                      setState(() {
                        _isVehicule = index == 1;
                      });
                      print('switched to: $index');
                    },
                    minWidth: 70.0,
                    cornerRadius: 15.0,
                    activeBgColors: [
                      [Color(secondaryColor)!],
                      [Color(primaryColor)!],
                    ],
                    activeFgColor: Color(whiteColor),
                    inactiveBgColor: Color(whiteColor),
                    inactiveFgColor: Color(primaryColor),
                    initialLabelIndex: _isVehicule ? 1 : 0,
                    totalSwitches: 2,
                    labels: ['Non', 'Oui'],
                    radiusStyle: true,
                    borderColor: [Color(secondaryColor)],
                    borderWidth: 1.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    "Vous êtes un chauffeur?",
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: usernamedController,
                decoration: InputDecoration(
                  hintText: 'Nom d\'utilisateur',
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
                    Icons.person_2_rounded,
                    size: 30,
                    color: Color(whiteColor),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
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
              TextField(
                controller: otherController,
                decoration: InputDecoration(
                  hintText: _isVehicule ? 'Numéro permis' : 'Votre travail',
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
                  prefixIcon: _isVehicule
                      ? const Icon(
                          Icons.drive_eta_rounded,
                          size: 30,
                          color: Color(whiteColor),
                        )
                      : const Icon(
                          Icons.work,
                          size: 30,
                          color: Color(whiteColor),
                        ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: _register,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  minimumSize: const Size(double.infinity, 0.0),
                  backgroundColor: Color(secondaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Enregistrer',
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
                      builder: (context) => const LoginPage(),
                    ),
                  );
                  print("Retour");
                },
                child: Text(
                  'Vous avez déjà un compte ?',
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
