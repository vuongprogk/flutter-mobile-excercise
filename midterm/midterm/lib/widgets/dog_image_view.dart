import 'package:flutter/material.dart';
import '../data/dog_api.dart';
import '../main.dart';

class DogImageView extends StatefulWidget {
  final String breed;
  final String imageUrl;

  const DogImageView({super.key, required this.breed, required this.imageUrl});

  @override
  DogImageViewState createState() => DogImageViewState();
}

class DogImageViewState extends State<DogImageView> {
  late String _currentImageUrl;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _currentImageUrl = widget.imageUrl;
  }

  Future<void> _loadNewImage() async {
    try {
      final newImageUrl = (await DogApi.fetchBreedImages(widget.breed)).first;
      setState(() {
        _currentImageUrl = newImageUrl;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load new image')),
        );
      }
    }
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    final themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    MyApp.of(context).setThemeMode(themeMode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breed, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: _toggleDarkMode,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(_currentImageUrl),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _loadNewImage,
                child: const Text('Load New Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
