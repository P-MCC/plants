import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../posts/models/garden_model.dart';
import '../../posts/service/garden_service.dart';
import '../shared/widgets/custom_fav_gesture_detector.dart';
import 'login_page.dart';

class GardenList extends StatefulWidget {
  const GardenList({Key? key}) : super(key: key);

  @override
  State<GardenList> createState() => _GardenListState();
}

class _GardenListState extends State<GardenList> {
  final _storage = const FlutterSecureStorage();

  Future<void> _logout() async {
    await _storage.delete(key: 'isLoggedIn');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false,
    );
  }
  RemoteService remoteService = RemoteService();
  late Welcome speciesList;
  var isLoaded = false;

  @override
  void initState(){
    super.initState();
    fetchSpeciesList();
  }

  Future<void> fetchSpeciesList() async {
    Welcome list = await remoteService.fetchSpeciesList();
    setState(() {
      speciesList = list;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            const Text("Garden"),
            const Spacer(),// Adding space between the title and exit icon
            IconButton(
              onPressed: _logout,
              icon: const Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
      body: isLoaded
          ? ListView.builder(
          itemCount: speciesList.data.length,
          itemBuilder: (context, index){
            return GardenCard(
              title: speciesList.data[index].commonName,
              thumbnailUrl: speciesList.data[index].defaultImage.mediumUrl,
              id: speciesList.data[index].id,
              scientificName: speciesList.data[index].scientificName,
              watering: speciesList.data[index].watering,
              sunlight: speciesList.data[index].sunlight,
              cycle: speciesList.data[index].cycle,

            );
          }
      )
          : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
