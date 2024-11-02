import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnhancedSettingsPage extends StatelessWidget {
  const EnhancedSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(Icons.person, color: Colors.orange, size: 30),
              title: const Text('Account Settings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle:
                  const Text('Manage your account details and preferences'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications,
                  color: Colors.orange, size: 30),
              title: const Text('Notifications',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: const Text('Customize your notification settings'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.lock, color: Colors.orange, size: 30),
              title: const Text('Privacy',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: const Text('Adjust your privacy settings'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading:
                  const Icon(Icons.color_lens, color: Colors.orange, size: 30),
              title: const Text('Theme',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: const Text('Switch between light and dark mode'),
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
            const Divider(),
            ListTile(
              leading:
                  const Icon(Icons.language, color: Colors.orange, size: 30),
              title: const Text('Language',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: const Text('Select your preferred language'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.orange, size: 30),
              title: const Text('Help & Support',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: const Text('Get assistance and find FAQs'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red, size: 30),
              title: const Text('Logout',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              onTap: () async {
                await _showConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  ///Show Confirmation Dialog
  Future<bool> _showConfirmationDialog(BuildContext context) async {
    return await showCupertinoDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: const Text(
                'Confirm',
              ),
              content: const Text(
                'Are you sure you want to Logout?',
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Cancel'),
                  onPressed: () {
                    /// Return false when Cancel is pressed
                    Navigator.of(context).pop(false);
                  },
                ),
                CupertinoDialogAction(
                  child: const Text('Yes'),
                  onPressed: () {
                    /// Return true when Yes is pressed
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;

    /// Default to false if dialog is dismissed
  }
}
