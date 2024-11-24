import 'package:flutter/material.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  Widget _buildCard(String imagePath, String imageName) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              imageName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
        title: const Text('Foto-foto'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCard('assets/images/laut.jpeg', 'Pinggiran Laut'),
          const SizedBox(height: 16),
          _buildCard('assets/images/perahu.jpeg', 'Sewa Perahu'),
          const SizedBox(height: 16),
          _buildCard('assets/images/spotFoto.jpeg', 'Spot Foto'),
          const SizedBox(height: 16),
          _buildCard('assets/images/spotMancing.jpeg', 'Spot Mancing'),
          const SizedBox(height: 16),
          _buildCard('assets/images/tempatAnak.jpeg', 'Tempat Bermain Anak'),
          const SizedBox(height: 16),
          _buildCard('assets/images/kandangRusa.jpeg', 'Kandang Rusa'),
          const SizedBox(height: 16),
          _buildCard('assets/images/pedagangKakiLima.jpeg', 'Spot Pedagang Kaki Lima'),
          const SizedBox(height: 16),
          _buildCard('assets/images/mushola.jpeg', 'Mushola'),
          const SizedBox(height: 16),
          _buildCard('assets/images/toiletTempatBilas.jpeg', 'Toilet dan Tempat Bilas'),
        ],
      ),
    );
  }
}