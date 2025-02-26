import 'package:flutter/material.dart';

class DogBreedsListItem extends StatelessWidget {
  final String breed;
  final Function(bool) onTap;
  final VoidCallback onFavoriteToggle;
  final bool isFavorite;

  const DogBreedsListItem({
    super.key,
    required this.breed,
    required this.onTap,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          breed,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.image),
              color: Colors.blue,
              onPressed: () => onTap(false),
            ),
            IconButton(
              icon: const Icon(Icons.folder_copy_rounded),
              color: Colors.green,
              onPressed: () => onTap(true),
            ),
            IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              color: isFavorite ? Colors.red : Colors.grey,
              onPressed: onFavoriteToggle,
            ),
          ],
        ),
      ),
    );
  }
}
