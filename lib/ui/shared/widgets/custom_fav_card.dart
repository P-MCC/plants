import 'package:flutter/material.dart';

import '../../pages/extreme_details_page.dart';
import '../../pages/favorites_page.dart';

class FavoritesCard extends StatefulWidget {
  final String title;
  final String thumbnailUrl;
  final dynamic  id;

  final List<String>? scientificName;
  final String? watering;
  final List<String>? sunlight;
  final String? cycle;

  final String ?family;
  final List<String>? origin;
  final String ? type;
  final String ?dimension;
  final String? maintenance;
  final String ?growthRate;

  const FavoritesCard({super.key,
    required this.title,
    required this.thumbnailUrl,
    this.id,
    this.scientificName,
    this.watering,
    this.sunlight,
    this.cycle,
    this.family,
    this.origin,
    this.type,
    this.dimension,
    this.maintenance,
    this.growthRate,
  });

  @override
  State<FavoritesCard> createState() => _FavoritesCardState();
}

class _FavoritesCardState extends State<FavoritesCard> {
  @override
  bool isFavorite = true;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => eDetails(
              title: widget.title,
              thumbnailUrl: widget.thumbnailUrl,
              scientificName:widget.scientificName?.first,
              watering:widget.watering,
              sunlight:widget.sunlight?.first,
              cycle:widget.cycle,
              family:widget.family,
              origin:widget.origin,
              type:widget.type,
              dimension:widget.dimension,
              maintenance:widget.maintenance,
              growthRate:widget.growthRate,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(widget.thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  toggleFavorite();
                  // Call a method to add/remove the item from favorites list
                  Favorites.removeFavorites(widget.id, isFavorite);
                },
                child: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
