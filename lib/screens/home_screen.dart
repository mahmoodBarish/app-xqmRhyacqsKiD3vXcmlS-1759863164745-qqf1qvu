import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildHeader(),
                      const SizedBox(height: 30),
                      _buildSectionTitle('Your Insights'),
                      const SizedBox(height: 20),
                      _buildInsightsGrid(context),
                      const SizedBox(height: 30),
                      _buildExploreMore(),
                      const SizedBox(height: 20),
                      _buildExploreList(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Hello 👋🏻\n',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF363636),
                    ),
                  ),
                  TextSpan(
                    text: 'Christie Doe',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF363636),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 23,
          backgroundImage: AssetImage('assets/images/225_267.png'),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF363636),
      ),
    );
  }

  Widget _buildInsightsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardHeight = constraints.maxWidth * 0.48;
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InsightCard(
                    title: 'Scan new',
                    subtitle: 'Scanned 483',
                    icon: Icons.qr_code_scanner_outlined,
                    iconBgColor: const Color(0xFFDAD9F7),
                    iconColor: const Color(0xFF5A6CF3),
                    height: cardHeight,
                    onTap: () {
                      context.push('/scan_screen');
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InsightCard(
                    title: 'Counterfeits',
                    subtitle: 'Counterfeited 32',
                    icon: Icons.block,
                    iconBgColor: const Color(0xFFF6E3DA),
                    iconColor: const Color(0xFFF08F5F),
                    height: cardHeight,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InsightCard(
                    title: 'Success',
                    subtitle: 'Checkouts 8',
                    icon: Icons.check_circle_outline,
                    iconBgColor: const Color(0xFFD8F3F1),
                    iconColor: const Color(0xFF5CC8CD),
                    height: cardHeight,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InsightCard(
                    title: 'Directory',
                    subtitle: 'History 26',
                    icon: Icons.folder_open_outlined,
                    iconBgColor: const Color(0xFFD0ECFA),
                    iconColor: const Color(0xFF2DB3FF),
                    height: cardHeight,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildExploreMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSectionTitle('Explore More'),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward, color: Color(0xFF363636)),
        ),
      ],
    );
  }

  Widget _buildExploreList() {
    return SizedBox(
      height: 125,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildExploreItem('assets/images/225_240.png'),
          const SizedBox(width: 16),
          _buildExploreItem('assets/images/225_241.png'),
          const SizedBox(width: 16),
          _buildExploreItem('assets/images/225_242.png'),
        ],
      ),
    );
  }

  Widget _buildExploreItem(String imagePath) {
    return AspectRatio(
      aspectRatio: 127 / 125,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home,
            isActive: true,
            onTap: () {},
          ),
          _buildNavItem(
            icon: Icons.notifications_none_outlined,
            hasNotification: true,
            onTap: () {},
          ),
          _buildNavItem(
            icon: Icons.qr_code_scanner,
            onTap: () {
              context.push('/scan_screen');
            },
          ),
          _buildNavItem(
            icon: Icons.account_balance_wallet_outlined,
            onTap: () {},
          ),
          _buildNavItem(
            icon: Icons.settings_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    bool isActive = false,
    bool hasNotification = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 47,
            height: 47,
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFFD0ECFA).withOpacity(0.8)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              color:
                  isActive ? const Color(0xFF2DB3FF) : const Color(0xFFBBBBBB),
              size: 28,
            ),
          ),
          if (hasNotification)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF7E7E),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class InsightCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final double height;
  final VoidCallback onTap;

  const InsightCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8FA),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: iconColor, size: 30),
            ),
            const Spacer(),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF363636),
              ),
            ),
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFB7B7C2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}