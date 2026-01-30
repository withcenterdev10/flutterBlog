import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterblognew/utils/consts.dart';
import 'package:flutterblognew/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool hasUser = false;

    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => {context.go('/${Pages.signIn.name}')},
          child: const Text('Go to the Details screen'),
        ),
      ),
      endDrawer: const BlogDrawer(),
    );
  }
}
