import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_keeper/providers/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool vibrationEnabled = true; 
  bool soundEnabled = true;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {

    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Theme Section
          _buildSectionHeader('Apprearance'),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme();
            },
          ),

          _buildSectionHeader('Feedback'),
          SwitchListTile(
            title: const Text('Vibration'),
            subtitle: const Text('Vibrate on score change'),
            value: vibrationEnabled,
            onChanged: (value) {
              setState(() {
                vibrationEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Sound Effects'),
            subtitle: const Text('Play sound on score change'),
            value: soundEnabled,
            onChanged: (value) {
              setState(() {
                soundEnabled = value;
              });
            },
          ),

                    // Language Section
          _buildSectionHeader('Language'),
          ListTile(
            title: const Text('App Language'),
            subtitle: Text(selectedLanguage),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Implement language selection
            },
          ),

          // About Section
          _buildSectionHeader('About'),
          const ListTile(
            title: Text('Version'),
            subtitle: Text('1.0.0'),
          ),
        ]
      )
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

}