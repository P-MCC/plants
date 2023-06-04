import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../posts/models/favorites_model.dart';
import '../../posts/service/favorites_service.dart';
import '../shared/widgets/custom_fav_card.dart';

class Favorites extends StatefulWidget {
  static Set<int> favorites = {};
  static final GlobalKey<_FavoritesState> _favoritesKey = GlobalKey<_FavoritesState>();

  static void updateFavorites(int id, bool isFavorite) {
    if (isFavorite) {
      favorites.add(id);
    } else {
      favorites.remove(id);
    }
    saveFavorites(); // Save favorites after update
    _favoritesKey.currentState?.refreshFavorites();
  }

  static void removeFavorites(int id, bool isFavorite) {
    if (!isFavorite) {
      favorites.remove(id);
    }
    saveFavorites(); // Save favorites after removal
    _favoritesKey.currentState?.refreshFavorites();

    _FavoritesState? state = _currentState;
    state?.refreshFavorites();
  }

  static Future<void> saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorites', favorites.map((id) => id.toString()).toList());
  }

  static Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favoritesStringList = prefs.getStringList('favorites');
    if (favoritesStringList != null) {
      favorites = Set<int>.from(favoritesStringList.map((id) => int.parse(id)));
    }
  }

  static _FavoritesState? _currentState;

  @override
  _FavoritesState createState(){
    _currentState = _FavoritesState();
    return _currentState!;
  }
}

class _FavoritesState extends State<Favorites> {
  List<Welcome2> favoriteSpeciesList = [];

  void refreshFavorites() {
    fetchData();
  }

  @override
  void initState() {
    super.initState();
    Favorites.loadFavorites().then((_) {
      fetchData(); // Fetch data after loading favorites
    });
  }

  Future<void> fetchData() async {
    List<Welcome2> results = [];

    for (int id in Favorites.favorites) {
      Welcome2? species = await RemoteFavoritesService().fetchFavoriteSpeciesList(id);
      if (species != null) {
        results.add(species);
      }
    }

    setState(() {
      favoriteSpeciesList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteSpeciesList.length,
        itemBuilder: (context, index) {
          return FavoritesCard(
            title: favoriteSpeciesList[index].commonName,
            thumbnailUrl: favoriteSpeciesList[index].defaultImage.originalUrl,
            id: favoriteSpeciesList[index].id,
            scientificName:favoriteSpeciesList[index].scientificName,
            watering:favoriteSpeciesList[index].watering,
            sunlight:favoriteSpeciesList[index].sunlight,
            cycle:favoriteSpeciesList[index].cycle,
            family:favoriteSpeciesList[index].family,
            origin:favoriteSpeciesList[index].origin,
            type:favoriteSpeciesList[index].type,
            dimension:favoriteSpeciesList[index].dimension,
            maintenance:favoriteSpeciesList[index].maintenance,
            growthRate:favoriteSpeciesList[index].growthRate,
          );
        },
      ),
    );
  }
}
