import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../task2/data_dummy.dart';

// TASK 1 - Implementasi UI Onboarding "All your favorites"
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const String _illustrationUrl =
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836'
      '?auto=format&fit=crop&w=600&q=80';

  void _goToOrders(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const OrderListPage()));
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
                                        color: Colors.deepOrange,
                                      ),
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


  }
}
