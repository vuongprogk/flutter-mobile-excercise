import 'package:flutter/material.dart';
import '../data/dog_api.dart';
import '../main.dart';

class DogImagesView extends StatefulWidget {
  final String breed;
  final List<String> imageUrls;

  const DogImagesView({
    super.key,
    required this.breed,
    required this.imageUrls,
  });

  @override
  DogImagesViewState createState() => DogImagesViewState();
}

class DogImagesViewState extends State<DogImagesView> {
  late List<String> _imageUrls;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _imageUrls = widget.imageUrls;
  }

  Future<void> _loadMoreImages() async {
    try {
      final newImageUrls = await DogApi.fetchBreedImages(widget.breed);
      setState(() {
        _imageUrls.addAll(newImageUrls);
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to load more images')),
      );
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
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: _imageUrls.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(_imageUrls[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isDarkMode ? Colors.grey[800] : Colors.blue,
                ),
                onPressed: _loadMoreImages,
                child: const Text('Load More Images'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
