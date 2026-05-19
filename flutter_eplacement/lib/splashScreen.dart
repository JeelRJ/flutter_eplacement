import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: const BoxDecoration(

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [
              Color(0xff1F1C2C),
              Color(0xff2C3E50),
            ],
          ),
        ),

        child: SafeArea(

          child: Center(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  // VERSION
                  Align(
                    alignment: Alignment.topRight,

                    child: Container(

                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 7,
                      ),

                      decoration: BoxDecoration(
                        color: const Color(0xff00A86B),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: const Text(
                        "v1.0",

                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // SIMPLE LOGO
                  Image.asset(
                    "assets/images/logonexthire.png",
                    height: 95,
                    width: 95,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 30),

                  // APP NAME
                  const Text(
                    "NextHire",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // TAGLINE
                  const Text(
                    "Your Gateway To Off-Campus Success",

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 45),

                  // LOADER
                  const SizedBox(
                    width: 28,
                    height: 28,

                    child: CircularProgressIndicator(
                      color: Color(0xff00A86B),
                      strokeWidth: 3,
                    ),
                  ),

                  const SizedBox(height: 22),

                  // LOADING TEXT
                  const Text(
                    "Building Careers Beyond Campus...",

                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 50),

                  // COPYRIGHT
                  const Text(
                    "© 2026 NextHire",

                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}