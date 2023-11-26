import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trafic_app/helpers/colors.dart';
import 'package:trafic_app/viewmodels/auth_viewmodel.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _otherInfoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = '';
    _usernameController.text = '';
    _otherInfoController.text = '';
  }

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _otherInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    setState(() {
      _emailController.text = authViewModel.userAuth?.email ?? 'Email';
      _usernameController.text = authViewModel.userAuth?.username ?? 'Username';
      _otherInfoController.text = authViewModel.userAuth?.work ?? 'Work';
    });
    return Container(
      color: Color(whiteColor),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(height: 16),
            Text(
              'Adresse e-mail',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _emailController,
            ),
            SizedBox(height: 16),
            Text(
              'Nom d\'utilisateur',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _usernameController,
            ),
            SizedBox(height: 16),
            Text(
              'Autres informations',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _otherInfoController,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(primaryColor), // Couleur de fond du bouton
                    ),
                    onPressed: () {
                      // Action du bouton "Enregistrer"
                      // Récupérer les valeurs des champs de texte et effectuer les opérations nécessaires
                    },
                    child: Text('Enregistrer'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // Couleur de fond du bouton
                    ),
                    onPressed: () {
                      authViewModel.logout();
                      // Action du bouton "Déconnexion"
                      // Effectuer les opérations de déconnexion
                    },
                    child: Text('Déconnexion'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
