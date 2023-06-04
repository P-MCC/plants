import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../pages/details_page.dart';
import '../../pages/favorites_page.dart';

class GardenCard extends StatefulWidget {
  final String title;
  final String thumbnailUrl;
  final dynamic  id;

  final List<String>? scientificName;
  String ? watering;
  final List<dynamic>? sunlight;

  String ? cycle;

  GardenCard({
    required this.title,
    required this.thumbnailUrl,
    this.id,
    this.scientificName,
    this.watering,
    this.sunlight,
    this.cycle
  });

  @override
  _GardenCardState createState() => _GardenCardState();
}

class _GardenCardState extends State<GardenCard> {
  bool isFavorite = false;

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
            builder: (context) => Details(
              title: widget.title,
              thumbnailUrl: widget.thumbnailUrl,
              id: widget.id,
              scientificName: widget.scientificName?.first,
              watering: widget.watering,
              sunlight: widget.sunlight?.first,
              cycle: widget.cycle,

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
                    fontSize: 19,
                    color: Colors.white
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
                  Favorites.updateFavorites(widget.id, isFavorite);
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
