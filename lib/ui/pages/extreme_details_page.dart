import 'package:flutter/material.dart';

class eDetails extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  String? scientificName;
  String? watering;
  String? sunlight;
  String? cycle;

  String ?family;
  List<String> ?origin;
  String ? type;
  String ?dimension;
  String? maintenance;
  String ?growthRate;

  eDetails({
    required this.title,
    required this.thumbnailUrl,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(title),
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
                thumbnailUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(

            title: Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '     This $type\'s scientific name is ${scientificName?.toLowerCase() ?? ''}. '
                  'This plant needs ${watering?.toLowerCase() ?? ''} watering. ${sunlight?.toLowerCase() ?? ''} sunlight is the best for the health and the growth of this species. '
                  'It has ${cycle?.toLowerCase() ?? ''} life cycle.It\'s origin is\\are $origin. Needs ${watering?.toLowerCase() ?? ''} watering.'
                  ' It belongs to the $family family.\nDimensions and growth rate are as follows: \n$dimension \nGrowth Rate:$growthRate'
                  ' \nLastly, maintenance of this $type is $maintenance.',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
