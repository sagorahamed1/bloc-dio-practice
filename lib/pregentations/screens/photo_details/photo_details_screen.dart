import 'package:flutter/material.dart';

class PhotoDetailsScreen extends StatelessWidget {
  final String photo;
  final String title;
  const PhotoDetailsScreen({super.key, required this.title, required this.photo});

  @override
  Widget build(BuildContext context) {
    print("=========================================photo : ${photo}");
    return Scaffold(
      appBar: AppBar(title: const Text("Photo Details"), centerTitle: true),

      body: Column(
        children: [
          const SizedBox(height: 50),
          Image.network(photo),

          const SizedBox(height: 50),
          Text(title.toString())
        ],
      ),
    );
  }
}
