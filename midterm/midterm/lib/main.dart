import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';
import 'data/dog_api.dart';
import 'widgets/dog_breeds_list.dart';
import 'widgets/dog_image_view.dart';
import 'widgets/dog_images_view.dart';
import 'widgets/breed_search_delegate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  final database = openDatabase(
    join(await getDatabasesPath(), 'favorites.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE favorites(id INTEGER PRIMARY KEY, breed TEXT)",
      );
    },
    version: 1,
  );
  runApp(MyApp(database: database));
}

class MyApp extends StatefulWidget {
  final Future<Database> database;

  const MyApp({super.key, required this.database});

  static MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<MyAppState>()!;
  }

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void setThemeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      themeMode: _themeMode,
      home: MyHomePage(title: 'Dog Breeds List', database: widget.database),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Future<Database> database;

  const MyHomePage({super.key, required this.title, required this.database});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _breeds = [];
  List<String> _filteredBreeds = [];
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _fetchBreeds();
  }

  Future<void> _fetchBreeds() async {
    try {
      final breeds = await DogApi.fetchBreeds();
      setState(() {
        _breeds = breeds;
        _filteredBreeds = breeds;
      });
    } catch (e) {
      throw Exception('Failed to load breeds');
    }
  }

  void _onBreedTap(String breed, bool fetchMultiple) async {
    try {
      if (fetchMultiple) {
        final imageUrls = await DogApi.fetchBreedImages(breed);
        if (!mounted) return;
        Navigator.push(
          context as BuildContext,
          MaterialPageRoute(
            builder:
                (context) => DogImagesView(breed: breed, imageUrls: imageUrls),
          ),
        );
      } else {
        final imageUrls = await DogApi.fetchBreedImages(breed);
        if (!mounted) return;
        Navigator.push(
          context as BuildContext,
          MaterialPageRoute(
            builder:
                (context) =>
                    DogImageView(breed: breed, imageUrl: imageUrls.first),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context as BuildContext,
      ).showSnackBar(const SnackBar(content: Text('Failed to load images')));
    }
  }

  void _searchBreeds(String query) {
    final filteredBreeds =
        _breeds.where((breed) {
          final breedLower = breed.toLowerCase();
          final queryLower = query.toLowerCase();
          return breedLower.contains(queryLower);
        }).toList();

    setState(() {
      _filteredBreeds = filteredBreeds;
    });
  }

  void _clearSearch() {
    setState(() {
      _filteredBreeds = _breeds;
    });
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    final themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    MyApp.of(context as BuildContext).setThemeMode(themeMode);
  }

  Future<void> _toggleFavorite(String breed) async {
    final db = await widget.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorites',
      where: 'breed = ?',
      whereArgs: [breed],
    );

    if (maps.isEmpty) {
      await db.insert('favorites', {
        'breed': breed,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    } else {
      await db.delete('favorites', where: 'breed = ?', whereArgs: [breed]);
    }

    setState(() {});
  }

  Future<bool> _isFavorite(String breed) async {
    final db = await widget.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'favorites',
      where: 'breed = ?',
      whereArgs: [breed],
    );
    return maps.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: BreedSearchDelegate(
                  breeds: _breeds,
                  onSearch: _searchBreeds,
                ),
              );
            },
          ),
          if (_filteredBreeds.length != _breeds.length)
            IconButton(icon: const Icon(Icons.clear), onPressed: _clearSearch),
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
        child:
            _filteredBreeds.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : DogBreedsList(
                  breeds: _filteredBreeds,
                  onBreedTap: _onBreedTap,
                  onFavoriteToggle: _toggleFavorite,
                  isFavorite: _isFavorite,
                ),
      ),
    );
  }
}
