import 'package:flutter/material.dart';

class BreedSearchDelegate extends SearchDelegate {
  final List<String> breeds;
  final Function(String) onSearch;

  BreedSearchDelegate({required this.breeds, required this.onSearch});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          onSearch(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    onSearch(query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions =
        breeds.where((breed) {
          final breedLower = breed.toLowerCase();
          final queryLower = query.toLowerCase();
          return breedLower.contains(queryLower);
        }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            onSearch(query);
            close(context, null);
          },
        );
      },
    );
  }
}
