import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/uniqlo.dart';
import 'package:flutter_application_1/Model/price.dart';

class UniqloDetail extends StatefulWidget {
  final Uniqlo uniqlo;
  const UniqloDetail({super.key, required this.uniqlo});

  @override
  State<UniqloDetail> createState() => _UniqloDetailState();
}

class _UniqloDetailState extends State<UniqloDetail> {
  int qty = 1;

  Widget _roundButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.uniqlo.price * qty;

    return Scaffold(
      appBar: AppBar(title: Text(widget.uniqlo.imgLabel)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image(
                image: AssetImage(widget.uniqlo.imageUrl),
                width: 320,
                height: 220,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),

            Text(
              widget.uniqlo.imgLabel,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            Text(widget.uniqlo.description),
            const SizedBox(height: 12),

            Text(
              'Price: ฿${widget.uniqlo.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _roundButton(
                      icon: Icons.remove,
                      onPressed: () {
                        setState(() {
                          if (qty > 1) qty--;
                        });
                      },
                    ),

                    const SizedBox(width: 10),

                    Text(
                      'Total: $qty',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(width: 10),

                    _roundButton(
                      icon: Icons.add,
                      onPressed: () {
                        setState(() {
                          qty++;
                        });
                      },
                    ),
                  ],
                ),

                Text(
                  'Total: ฿${total.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}