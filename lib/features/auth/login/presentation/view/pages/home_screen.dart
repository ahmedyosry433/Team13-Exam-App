import 'package:exam_app/config/di/injectable_config.dart';
import 'package:exam_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FlutterSecureStorage fss = getIt<FlutterSecureStorage>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: ()  {
           
              context.go(Routes.login);
          
          },
        ),
        title: const Text('Home Screen'),
      ),
    );
  }
}