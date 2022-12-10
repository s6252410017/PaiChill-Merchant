import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_paicill_app/views/loginpage_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({Key? key}) : super(key: key);

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/js/coffee.json',
          controller: _controller,
          onLoaded: (comp) {
            _controller.duration = comp.duration;
            _controller.forward().then((value) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPageUI()));
            });

            _controller.addStatusListener((status) {
              if (status == AnimationStatus.completed) {}
            });
          },
        ),
      ),
    );
  }
}
