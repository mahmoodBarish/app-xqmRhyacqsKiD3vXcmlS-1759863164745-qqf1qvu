import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 10, bottom: 10),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF5A6CF3),
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/225_197.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: _buildScannerArea(context),
                  ),
                ),
                _buildProductCard(context),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerArea(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scannerSize = screenWidth * 0.7;

    return Center(
      child: SizedBox(
        width: scannerSize,
        height: scannerSize * 1.2, // Rectangular shape
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: ScannerPainter(),
              ),
            ),
            Container(
              height: 2,
              width: scannerSize,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.0),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFAD6D48).withOpacity(0.15),
              blurRadius: 50,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(9.0),
              child: Image.asset(
                'assets/images/225_211.png',
                width: 53,
                height: 52,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Lauren’s',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xFFC2C2C2),
                      letterSpacing: 0.36,
                    ),
                  ),
                  Text(
                    'Orange Juice',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF494949),
                      letterSpacing: 0.48,
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                context.push('/cart');
              },
              borderRadius: BorderRadius.circular(11),
              child: Container(
                width: 45,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF5A6CF3),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScannerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final cornerLength = size.width * 0.15;

    // Top-left corner
    final topLeftPath = Path();
    topLeftPath.moveTo(cornerLength, 0);
    topLeftPath.lineTo(0, 0);
    topLeftPath.lineTo(0, cornerLength);
    canvas.drawPath(topLeftPath, paint);

    // Top-right corner
    final topRightPath = Path();
    topRightPath.moveTo(size.width - cornerLength, 0);
    topRightPath.lineTo(size.width, 0);
    topRightPath.lineTo(size.width, cornerLength);
    canvas.drawPath(topRightPath, paint);

    // Bottom-left corner
    final bottomLeftPath = Path();
    bottomLeftPath.moveTo(0, size.height - cornerLength);
    bottomLeftPath.lineTo(0, size.height);
    bottomLeftPath.lineTo(cornerLength, size.height);
    canvas.drawPath(bottomLeftPath, paint);

    // Bottom-right corner
    final bottomRightPath = Path();
    bottomRightPath.moveTo(size.width - cornerLength, size.height);
    bottomRightPath.lineTo(size.width, size.height);
    bottomRightPath.lineTo(size.width, size.height - cornerLength);
    canvas.drawPath(bottomRightPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}