import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  Widget _buildReview({
    required String name,
    required int rating,
    required String review,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      color: index < rating ? Colors.amber : Colors.grey,
                      size: 18,
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Text(
                  review,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              _buildReview(
                name: 'Nama 1',
                rating: 4,
                review: 'Ini adalah placeholder untuk review singkat. Deskripsi dapat ditambahkan di sini.',
              ),
              const SizedBox(height: 15),
              _buildReview(
                name: 'Nama 2',
                rating: 5,
                review: 'Review kedua ini memberikan gambaran yang lebih mendetail tentang pengalaman pengguna.',
              ),
              const SizedBox(height: 15),
              _buildReview(
                name: 'Nama 3',
                rating: 3,
                review: 'Review ketiga adalah contoh dengan rating yang lebih rendah.',
              ),
              const SizedBox(height: 15),
              _buildReview(
                name: 'Nama 4',
                rating: 4,
                review: 'Review terakhir memberikan kesimpulan dari pengalaman pengguna.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}