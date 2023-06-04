import 'package:http/http.dart' as http;

import '../models/garden_model.dart';

class RemoteService{

  Future<Welcome> fetchSpeciesList() async {
    final response = await http.get(Uri.parse('https://perenual.com/api/species-list?page=5&key=sk-798C6474993ec0be41081'));

    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    } else {
      throw Exception('Failed to load species list');
    }
  }
}



void main() async {
  try {
    RemoteService remoteService = RemoteService();
    Welcome speciesList = await remoteService.fetchSpeciesList();
    print(speciesList.data.length);
    for (Datum plant in speciesList.data) {
      print(plant.id);
    }


  } catch (e) {
    print('Error: $e');
  }
}
