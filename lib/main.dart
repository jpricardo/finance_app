import 'package:finance_app/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance App',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationThemeData(isDense: true),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
          dynamicSchemeVariant: DynamicSchemeVariant.content,
          onSurfaceVariant: const Color.fromARGB(255, 119, 119, 119),
          surface: const Color.fromARGB(255, 17, 17, 17),
          surfaceContainer: const Color.fromARGB(255, 26, 26, 26),
          error: Colors.red,
          tertiary: Colors.green,
        ),
      ),

      home: const HomePage(),
    );
  }
}
