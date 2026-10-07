import 'package:flutter/material.dart';
import 'package:rickandmorty/screens/home.dart';
import 'package:get/get.dart';
import 'controllers/character_controller.dart';

void main() {
  Get.put(ListCharacterController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Rick and Morty',),
    );
  }
}