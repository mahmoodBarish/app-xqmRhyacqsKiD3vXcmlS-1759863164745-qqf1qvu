import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Container(
                      width: 45,
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8FA),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFF5A6BF3),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/225_548.png',
                      width: MediaQuery.of(context).size.width * 0.75,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Payment Success, Yayy!',
                      style: GoogleFonts.getFont(
                        'Helvetica Now Display',
                        color: const Color(0xFF363636),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.54,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'we will send order details and invoice in\nyour contact no. and registered email',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        'Helvetica Now Display',
                        color: const Color(0xFF7A7A7A),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.42,
                      ),
                    ),
                    const SizedBox(height: 28),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Text(
                        'Check Details',
                        style: GoogleFonts.getFont(
                          'Helvetica Now Display',
                          color: const Color(0xFF5A6BF3),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.32,
                        ),
                      ),
                      label: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF5A6BF3),
                        size: 20,
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 62,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go('/home_screen');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5A6BF3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Download Invoice',
                      style: GoogleFonts.getFont(
                        'Helvetica Now Display',
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.54,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}