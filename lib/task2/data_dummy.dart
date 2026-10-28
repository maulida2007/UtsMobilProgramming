import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// TASK 2 - Data dummy pesanan
final List<Map<String, dynamic>> dummyOrders = [
  {
    'id': 32053,
    'category': 'Breakfast',
    'title': 'Chicken Thai Biriyani',
    'price': 60,
    'imageUrl': 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32054,
    'category': 'Lunch',
    'title': 'Beef Burger with Fries',
    'price': 45,
    'imageUrl': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32055,
    'category': 'Dinner',
    'title': 'Creamy Pasta Carbonara',
    'price': 55,
    'imageUrl': 'https://images.unsplash.com/photo-1612874742237-6526221588e3?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
  {
    'id': 32056,
    'category': 'Dessert',
    'title': 'Berry Pancake Special',
    'price': 30,
    'imageUrl': 'https://images.unsplash.com/photo-1528207776546-365bb710ee93?auto=format&fit=crop&w=500&q=80',
    'status': 'pending',
  },
];

// Halaman daftar pesanan
class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  static const Color _orange = Color(0xFFFF7622);

  void _setStatus(int index, String status) {
    setState(() => dummyOrders[index]['status'] = status);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: Colors.blueGrey[900],
        title: Text(
          'My Orders',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.blueGrey[900],
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: dummyOrders.length,
        itemBuilder: (context, index) =>
            _buildOrderItem(dummyOrders[index], index),
      ),
    );
  }

  Widget _buildOrderItem(Map<String, dynamic> order, int index) {
    final String status = order['status'] as String;
    final bool pending = status == 'pending';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar makanan
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              order['imageUrl'] as String,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) => progress == null
                  ? child
                  : const SizedBox(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(color: _orange),
                      ),
                    ),
              errorBuilder: (_, _, _) => Container(
                width: 100,
                height: 100,
                color: Colors.grey.shade200,
                child: const Icon(Icons.fastfood, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Teks dan tombol
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${order['category']}',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: const Color(0xFFFF8A65),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  order['title'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey[900],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'ID: ${order['id']}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      '\$${order['price']}',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey[900],
                      ),
                    ),
                    const Spacer(),
                    if (pending) ...[
                      SizedBox(
                        height: 34,
                        child: ElevatedButton(
                          onPressed: () => _setStatus(index, 'done'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _orange,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Done',
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 34,
                        child: OutlinedButton(
                          onPressed: () => _setStatus(index, 'cancelled'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.deepOrange,
                            side: const BorderSide(color: Colors.deepOrange),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.poppins(fontSize: 12),
                          ),
                        ),
                      ),
                    ] else
                      Text(
                        status == 'done' ? 'Done' : 'Cancelled',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: status == 'done' ? Colors.green : Colors.red,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
