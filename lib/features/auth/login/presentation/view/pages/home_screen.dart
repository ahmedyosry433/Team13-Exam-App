import 'package:exam_app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(
    icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
    onPressed: () => context.pushReplacement(Routes.login),),
        title: Text('Home Screen'),
      ),
    );
  }
}