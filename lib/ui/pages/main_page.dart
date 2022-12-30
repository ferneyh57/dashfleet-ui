import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              'amb app'.toUpperCase(),
            ),
            const SizedBox(height: 12),
            const Text('Login'),
          ],
        ),
      ),
    );
  }
}
