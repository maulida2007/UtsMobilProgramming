import 'package:flutter/material.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your orders')),
      body: const Center(
        child: Text('No orders yet'),
      ),
    );
  }
}