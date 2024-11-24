import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final List<Map<String, dynamic>> _reviews = [
    {
      'name': 'Anita S.',
      'rating': 5,
      'review': 'Pantai Marina sangat indah! Tempat ini sempurna untuk bersantai dan menikmati matahari terbenam.',
    },
    {
      'name': 'Budi P.',
      'rating': 4,
      'review': 'Suasananya menyenangkan, tapi fasilitas kamar mandi perlu sedikit perbaikan.',
    },
    {
      'name': 'Citra L.',
      'rating': 3,
      'review': 'Pemandangannya bagus, tetapi pantainya agak ramai ketika saya datang.',
    },
    {
      'name': 'Dimas R.',
      'rating': 5,
      'review': 'Saya sangat menikmati kunjungan saya di sini. Stafnya ramah, dan tiket masuknya terjangkau!',
    },
    {
      'name': 'Ella T.',
      'rating': 4,
      'review': 'Pantai yang bagus dengan ombak tenang. Sayangnya, tempat parkir agak penuh di akhir pekan.',
    },
    {
      'name': 'Fadhil M.',
      'rating': 2,
      'review': 'Tidak terlalu sesuai harapan. Beberapa area terlihat kurang terawat.',
    },
    {
      'name': 'Gita K.',
      'rating': 5,
      'review': 'Spot yang sempurna untuk foto-foto. Sangat Instagramable!',
    },
    {
      'name': 'Hari W.',
      'rating': 3,
      'review': 'Pantai lumayan, tapi saya lebih suka pantai yang lebih sepi.',
    },
    {
      'name': 'Indah P.',
      'rating': 4,
      'review': 'Menyenangkan untuk keluarga, terutama anak-anak yang bermain di pasir.',
    },
    {
      'name': 'Joko S.',
      'rating': 5,
      'review': 'Pengalaman luar biasa! Saya akan datang lagi bersama teman-teman saya.',
    },
  ];


  final _nameController = TextEditingController();
  final _reviewController = TextEditingController();
  int _selectedRating = 5;

  void _addReview() {
    if (_nameController.text.isNotEmpty && _reviewController.text.isNotEmpty) {
      setState(() {
        _reviews.add({
          'name': _nameController.text,
          'rating': _selectedRating,
          'review': _reviewController.text,
        });
      });
      _nameController.clear();
      _reviewController.clear();
      _selectedRating = 5;
      Navigator.pop(context); // Menutup modal
    }
  }

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

  void _showAddReviewDialog() {
    int localSelectedRating = _selectedRating;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom + 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                labelText: 'Ulasan',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 15),
            StatefulBuilder(
              builder: (context, setState) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {
                        setState(() {
                          localSelectedRating = index + 1; // Update local state.
                        });
                      },
                      icon: Icon(
                        index < localSelectedRating ? Icons.star : Icons.star_border,
                        color: index < localSelectedRating ? Colors.amber : Colors.grey,
                      ),
                    );
                  }),
                );
              },
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedRating = localSelectedRating;
                });
                _addReview();
              },
              child: const Text('Tambah Review'),
            ),
          ],
        ),
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
            children: [
              ..._reviews.map((review) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: _buildReview(
                  name: review['name'],
                  rating: review['rating'],
                  review: review['review'],
                ),
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddReviewDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
