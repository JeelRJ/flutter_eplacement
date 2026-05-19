import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
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

      child: Center(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              // VERSION
              Align(
                alignment: Alignment.topRight,

                child: Container(

                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xff00A86B),
                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: const Text(
                    "v1.0",

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // LOGO
              Image.asset(
                "assets/images/logonexthire.png",
                height: 120,
                width: 120,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 14),

              // APP NAME
              const Text(
                "NextHire",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 8),

              // TAGLINE
              const Text(
                "Your Gateway To Off-Campus Success",

                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 20),

              // LOADER
              const SizedBox(
                width: 26,
                height: 26,

                child: CircularProgressIndicator(
                  color: Color(0xff00A86B),
                  strokeWidth: 3,
                ),
              ),

              const SizedBox(height: 14),

              // LOADING TEXT
              const Text(
                "Building Careers Beyond Campus...",

                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 28),

              // COPYRIGHT
              const Text(
                "© 2026 NextHire",

                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}