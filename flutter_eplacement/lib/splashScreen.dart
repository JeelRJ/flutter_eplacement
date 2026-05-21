import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the proper material canvas
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
        // SafeArea prevents UI from going under the phone notch or status bar
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              children: [
                // --- TOP: Version Badge ---
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xff00A86B).withOpacity(0.15), // Tinted background
                      border: Border.all(color: const Color(0xff00A86B).withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      "v1.0",
                      style: TextStyle(
                        color: Color(0xff00A86B),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),

                // Pushes the middle content exactly to the center
                const Spacer(),

                // --- CENTER: Logo & Branding ---
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26, // Soft shadow behind logo
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/images/logonexthire.png",
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  "NextHire",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Your Gateway To Off-Campus Success",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 40),

                const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    color: Color(0xff00A86B),
                    strokeWidth: 3.5,
                    strokeCap: StrokeCap.round, // Modern rounded edges on the loader
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Building Careers Beyond Campus...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 13,
                    letterSpacing: 0.5,
                  ),
                ),

                // Pushes the bottom content to the bottom of the screen
                const Spacer(),

                // --- BOTTOM: Button & Copyright ---
                SizedBox(
                  width: double.infinity, // Full width button
                  height: 56, // Taller, more clickable button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/listings');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff00A86B),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      "Go To Listings",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "© 2026 NextHire",
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                
                // Extra padding at the very bottom
                const SizedBox(height: 12),

              ],
            ),
          ),
        ),
      ),
    );
  }
}