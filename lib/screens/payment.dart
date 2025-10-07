import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

enum PaymentMethod { creditCard, applePay }

class _PaymentState extends State<Payment> {
  PaymentMethod _selectedPaymentMethod = PaymentMethod.creditCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildPaymentMethodSelector(),
                      const SizedBox(height: 32),
                      _buildForm(),
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          'We will send you an order details to your email after the successfull payment',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.manrope(
                            fontSize: 12,
                            color: const Color(0xFFB1B1B1),
                            letterSpacing: 0.24,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      _buildPayButton(context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(1, 118, 63, 0.4),
            blurRadius: 27,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => context.pop(),
                child: Container(
                  width: 45,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8FA),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFF25D482),
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Checkout 💳',
                  style: GoogleFonts.manrope(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF363636),
                    letterSpacing: 0.66,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹ 1,527',
                      style: GoogleFonts.manrope(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF25D482),
                        letterSpacing: 0.6,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Including GST (18%)',
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        color: const Color(0xFFB1B1B1),
                        letterSpacing: 0.28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelector() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildPaymentOption(
              label: 'Credit card',
              icon: Icons.credit_card,
              isSelected: _selectedPaymentMethod == PaymentMethod.creditCard,
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = PaymentMethod.creditCard;
                });
              },
            ),
          ),
          Expanded(
            child: _buildPaymentOption(
              label: 'Apple Pay',
              icon: Icons.apple,
              isSelected: _selectedPaymentMethod == PaymentMethod.applePay,
              onTap: () {
                setState(() {
                  _selectedPaymentMethod = PaymentMethod.applePay;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
      {required String label,
      required IconData icon,
      required bool isSelected,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF25D482) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFF25D482).withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(4, 0),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : const Color(0xFF3A3C3F),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : const Color(0xFF3A3C3F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
            label: 'Card number',
            initialValue: '5261   4141   0151   8472',
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildMastercardLogo(),
                const SizedBox(width: 12),
                const Icon(Icons.credit_card, color: Color(0xFF929DA8)),
                const SizedBox(width: 16),
              ],
            )),
        const SizedBox(height: 24),
        _buildTextField(label: 'Cardholder name', initialValue: 'Christie Doe'),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: _buildTextField(
                  label: 'Expiry date', initialValue: '06   /   2024'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: _buildTextField(
                label: 'CVV / CVC',
                initialValue: '915',
                labelSuffix: const Icon(Icons.help_outline,
                    color: Color(0xFF25D482), size: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(
      {required String label,
      String? initialValue,
      Widget? suffixIcon,
      Widget? labelSuffix}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3A3C3F),
                letterSpacing: 0.32,
              ),
            ),
            if (labelSuffix != null) ...[
              const SizedBox(width: 8),
              labelSuffix,
            ]
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          initialValue: initialValue,
          style: GoogleFonts.manrope(
            fontSize: 16,
            color: const Color(0xFF424D58),
            letterSpacing: 0.8,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF8F8FA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }

  Widget _buildMastercardLogo() {
    return SizedBox(
      width: 27,
      height: 16,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFFF44336),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Color(0xFFFFC107),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push('/success_screen');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF25D482),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 18),
        minimumSize: const Size(double.infinity, 62),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.lock, color: Colors.white, size: 20),
          const SizedBox(width: 16),
          Text(
            'Pay for the order',
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}