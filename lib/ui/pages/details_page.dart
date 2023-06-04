import 'package:flutter/material.dart';

import 'favorites_page.dart';

class Details extends StatefulWidget {
  final String title;
  final String thumbnailUrl;
  final dynamic id;
  String? scientificName;
  String? watering;
  String? sunlight;
  String? cycle;

  Details({
    required this.title,
    required this.thumbnailUrl,
    required this.id,
    this.scientificName,
    this.watering,
    this.sunlight,
    this.cycle,
  });

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Image.network(
                widget.thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text(
              textAlign: TextAlign.center,
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'This plant\'s scientific name is ${widget.scientificName?.toLowerCase() ?? ''}. '
                  'This plant needs ${widget.watering?.toLowerCase() ?? ''} watering. ${widget.sunlight?.toLowerCase() ?? ''} sunlight is the best for the health and the growth of this species. '
                  'It has ${widget.cycle?.toLowerCase() ?? ''} life cycle.',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'For more information \nlike and visit your favorites section.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),

                GestureDetector(
                  onTap: () {
                    toggleFavorite();
                    // Call a method to add/remove the item from favorites list
                    Favorites.updateFavorites(widget.id, isFavorite);
                  },
                  child: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
