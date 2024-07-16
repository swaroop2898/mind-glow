import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text("Notification Settings"),
              leading: const Icon(Icons.notifications),
              trailing: Switch(
                value: true, // Example value, replace with your logic
                onChanged: (value) {
                  // Handle switch state change
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text("Dark Mode"),
              leading: const Icon(Icons.dark_mode),
              trailing: Switch(
                value: false, // Example value, replace with your logic
                onChanged: (value) {
                  // Handle switch state change
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Language"),
              leading: Icon(Icons.language),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to language selection screen
              },
            ),
            Divider(),
            ListTile(
              title: Text("Account"),
              leading: Icon(Icons.account_circle),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to account settings screen
              },
            ),
            Divider(),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to about screen
              },
            ),
            Divider(),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
              onTap: () {
                // Handle logout
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}


