import 'package:flutter/material.dart';
import 'package:score_keeper/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:score_keeper/screens/home_screen.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const ScoreBoardApp(),
    ),
  );
}

class ScoreBoardApp extends StatelessWidget {
  const ScoreBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Score Keeper',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            brightness: themeProvider.isDarkMode ? Brightness.dark : Brightness.light,
            useMaterial3: true,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
