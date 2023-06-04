import 'package:flutter/material.dart';

import '../../posts/models/favorites_model.dart';
import '../../posts/models/search_model.dart';
import '../../posts/service/favorites_service.dart';
import '../../posts/service/search_service.dart';
import '../shared/widgets/custom_search_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  SearchJason? searchResults;
  Set<int> searchResultIDs = {};
  List<Welcome2> finalResults = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchID() async {
    SearchJason species = await RemoteSearchService().fetchSearchSpeciesList(searchQuery);

    for (var result in species.data) {
      searchResultIDs.add(result.id);
    }


    setState(() {
      searchResults = species;
    });

    fetchData(); // Call fetchData after retrieving search results
  }

  Future<void> fetchData() async {
    List<Welcome2> results = [];

    for (int id in searchResultIDs) {
      Welcome2? species = await RemoteFavoritesService().fetchFavoriteSpeciesList(id);
      if (species != null) {
        results.add(species);
      }
    }

    setState(() {
      finalResults = results;
    });

    print('fetchData completed.');
    print(finalResults.length);
  }

  void _onSearchSubmitted(String query) {
    setState(() {
      searchQuery = query;
    });
    fetchID();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
          ),
          onSubmitted: _onSearchSubmitted,
        ),
      ),
      body: searchResults == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: finalResults.length,
        itemBuilder: (context, index) {
          return SearchCard(
            title: finalResults[index].commonName,
            thumbnailUrl: finalResults[index].defaultImage.originalUrl,
            id: finalResults[index].id,
          );
        },
      ),
    );
  }
}
