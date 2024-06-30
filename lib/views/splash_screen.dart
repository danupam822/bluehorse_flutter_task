import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_task/views/login_screen.dart';
import 'package:flutter_task/views/user_details_screen.dart';
import 'package:lottie/lottie.dart';

import '../utils/sharedpref/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await SharedPrefHelper().init(); // Ensure SharedPrefHelper is initialized
    String? userEmail = SharedPrefHelper().getString('userEmail');
    Timer(Duration(seconds: 4), () {
      if (userEmail == null || userEmail.isEmpty) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LogInScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => UserDetailsPage(userEmail: userEmail)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animation/splash_lotie.json',
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
