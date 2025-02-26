import 'dart:convert';
import 'package:http/http.dart' as http;

class DogApi {
  static Future<List<String>> fetchBreeds() async {
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breeds/list/all'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<String> breeds = [];
      (data['message'] as Map<String, dynamic>).forEach((key, value) {
        if (value.isEmpty) {
          breeds.add(key);
        } else {
          for (var subBreed in value) {
            breeds.add('$subBreed $key');
          }
        }
      });
      return breeds;
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  static Future<List<String>> fetchBreedImages(String breed) async {
    final breedParts = breed.split(' ');
    final breedPath =
        breedParts.length > 1
            ? '${breedParts[1]}/${breedParts[0]}'
            : breedParts[0];
    final response = await http.get(
      Uri.parse('https://dog.ceo/api/breed/$breedPath/images/random/5'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return List<String>.from(data['message']);
    } else {
      throw Exception('Failed to load images');
    }
  }
}
