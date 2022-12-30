import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('BIENVENIDO!'),
          SizedBox(
            width: 200,
            height: 200,
            child: Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_1t8na1gy.json',
            ),
          ),
        ],
      ),
    );
  }
}
