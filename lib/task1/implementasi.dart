import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../task2/data_dummy.dart';

// TASK 1 - Implementasi UI Onboarding "All your favorites"
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const String _illustrationUrl =
      'https://fulminoussoftware.com/assets-front/img/1stOrder/1stOrder-2.webp';

  void _goToOrders(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const OrderListPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: Colors.orange.shade100, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: Colors.orange.withValues(alpha: 0.15),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 20),
            child: Column(
              children: [
                // Ilustrasi
                Expanded(
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, c) {
                        final size = c.biggest.shortestSide.clamp(0.0, 300.0);
                        return Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(14),
                          child: ClipOval(
                            child: Image.network(
                              _illustrationUrl,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, progress) =>
                                  progress == null
                                      ? child
                                      : const Center(
                                          child: CircularProgressIndicator(
                                              color: Colors.deepOrange),
                                         ),
                              errorBuilder: (_, _, _) => const Icon(
                                Icons.fastfood,
                                size: 100,
                                color: Colors.deepOrange,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Judul
                Text(
                  'All your favorites',
                  style: GoogleFonts.poppins(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                  ),
                ),
                const SizedBox(height: 12),

                // Deskripsi
                Text(
                  'Get all your loved foods in one once place, '
                  'you just place the one we do the rest',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
                    color: Colors.blueGrey[400],
                  ),
                ),
                const SizedBox(height: 20),

                // Indikator halaman
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == 0
                            ? Colors.deepOrange
                            : Colors.deepOrange.shade100,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}