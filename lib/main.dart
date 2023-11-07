import 'package:flutter/material.dart';
import 'package:my_note_bloc/lc.dart';
import 'package:my_note_bloc/pages/home/views/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Bloc Demo",
      home: HomeView(),
    );
  }
}
