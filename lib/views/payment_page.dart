import 'package:flutter/material.dart';
import 'receipt_page.dart';
import '../utils/globals.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? _selectedPaymentMethod;

  final List<Map<String, dynamic>> _paymentMethods = [
    { "name": "Gopay", "logo": Icons.payment },
    { "name": "Shopeepay", "logo": Icons.shopping_bag },
    { "name": "Dana", "logo": Icons.wallet },
    { "name": "OVO", "logo": Icons.phone_android },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Metode Pembayaran'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _paymentMethods.length,
              itemBuilder: (context, index) {
                final method = _paymentMethods[index];
                return RadioListTile(
                  value: method["name"],
                  groupValue: _selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      _selectedPaymentMethod = value;
                    });
                  },
                  title: Text(method["name"]),
                  secondary: Icon(method["logo"], size: 40),
                );
              },
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Total',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    Text(
                      'Rp$totalPrice',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: _selectedPaymentMethod != null ? () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const ReceiptPage(),
                    ));
                  } : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40.0,
                      vertical: 12.0,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))
                  ),
                  child: const Text(
                    'Bayar',
                    style: TextStyle(fontSize: 20),
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