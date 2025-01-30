import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_vet_submission/src/presentation/views/home/controller/home_binding.dart';
import 'package:modern_vet_submission/src/presentation/views/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ModernVet Feedback',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      initialBinding: HomeBinding(),
      home: Home(),
    );
  }
}
