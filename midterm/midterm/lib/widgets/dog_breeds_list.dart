import 'package:flutter/material.dart';
import 'dog_breeds_list_item.dart';

class DogBreedsList extends StatelessWidget {
  final List<String> breeds;
  final Function(String, bool) onBreedTap;
  final Function(String) onFavoriteToggle;
  final Future<bool> Function(String) isFavorite;

  const DogBreedsList({
    super.key,
    required this.breeds,
    required this.onBreedTap,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: breeds.length,
      itemBuilder: (context, index) {
        return FutureBuilder<bool>(
          future: isFavorite(breeds[index]),
          builder: (context, snapshot) {
            final isFav = snapshot.data ?? false;
            return DogBreedsListItem(
              breed: breeds[index],
              onTap:
                  (fetchMultiple) => onBreedTap(breeds[index], fetchMultiple),
              onFavoriteToggle: () => onFavoriteToggle(breeds[index]),
              isFavorite: isFav,
            );
          },
        );
      },
    );
  }
}
