import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../start page/main_page.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.key),
          title: const Text("Account"),
          onTap: () {},
        ),
        const ListTile(
          leading: Icon(Icons.lock),
          title: Text("Privacy"),
        ),
        const ListTile(
          leading: Icon(Icons.message),
          title: Text("Playlists"),
        ),
        const ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notifications"),
        ),
        const ListTile(
          leading: Icon(Icons.people),
          title: Text("Invite Friend"),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Logout"),
          onTap: () {
            logoutDialog(context);
          },
        ),
      ],
    );
  }
}

logoutDialog(BuildContext context) {
  AuthService authService = AuthService();
  // set up the buttons
  Widget cancelButton = TextButton(
    child: const Text(
      "Cancel",
      style: TextStyle(color: Colors.deepPurple),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue", style: TextStyle(color: Colors.deepPurple)),
    onPressed: () {
      authService.signOut();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const MainPage()),
          (Route<dynamic> route) => false);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Logging out"),
    content: const Text("Are you sure?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
