import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8FC),
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFFEF8F5F),
                size: 20,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Your Cart 👍🏻',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: const Color(0xFF363636),
                letterSpacing: 0.66,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: const [
                CartItem(
                  imagePath: 'assets/images/225_362.png',
                  brand: 'Lauren’s',
                  name: 'Orange Juice',
                  price: '₹ 149',
                  quantity: 2,
                ),
                SizedBox(height: 18),
                CartItem(
                  imagePath: 'assets/images/225_363.png',
                  brand: 'Baskin’s',
                  name: 'Skimmed Milk',
                  price: '₹ 129',
                  quantity: 2,
                ),
                SizedBox(height: 18),
                CartItem(
                  imagePath: 'assets/images/225_364.png',
                  brand: 'Marley’s',
                  name: 'Aloe Vera Lotion',
                  price: '₹ 1249',
                  quantity: 2,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildCheckoutSection(context),
    );
  }

  Widget _buildCheckoutSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: const Color(0xFF363636),
                ),
              ),
              Text(
                '₹ 1,527',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: const Color(0xFFEF8F5F),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 62,
            child: ElevatedButton(
              onPressed: () {
                context.push('/payment');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF8F5F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: Text(
                'Proceed to checkout',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildBottomNavBar(context),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            context.go('/home_screen');
          },
          icon: const Icon(Icons.home_outlined,
              color: Color(0xFFBBBBBB), size: 28),
        ),
        IconButton(
          onPressed: () {
            context.go('/scan_screen');
          },
          icon: const Icon(Icons.qr_code_scanner,
              color: Color(0xFFBBBBBB), size: 28),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_outline,
              color: Color(0xFFBBBBBB), size: 28),
        ),
        Container(
          width: 47,
          height: 47,
          decoration: BoxDecoration(
            color: const Color(0xFFF6E4DA),
            borderRadius: BorderRadius.circular(11),
          ),
          child: IconButton(
            onPressed: () {
              context.go('/cart');
            },
            icon: const Icon(Icons.shopping_cart,
                color: Color(0xFFEF8F5F), size: 24),
          ),
        ),
      ],
    );
  }
}

class CartItem extends StatelessWidget {
  final String imagePath;
  final String brand;
  final String name;
  final String price;
  final int quantity;

  const CartItem({
    Key? key,
    required this.imagePath,
    required this.brand,
    required this.name,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FC),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.asset(
              imagePath,
              width: 60,
              height: 60,
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
                  brand,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: const Color(0xFFB1B1B1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xFF494949),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFFEF8F5F),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 25,
                  width: 25,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.remove,
                        size: 14, color: Color(0xFFEF8F5F)),
                  ),
                ),
                Text(
                  '$quantity',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF363636),
                  ),
                ),
                SizedBox(
                  height: 25,
                  width: 25,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(Icons.add,
                        size: 14, color: Color(0xFFEF8F5F)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}