
import 'package:http/http.dart' as http;

import '../models/search_model.dart';


class RemoteSearchService{

  Future<SearchJason> fetchSearchSpeciesList(search) async {

    final response = await http.get(Uri.parse('https://perenual.com/api/species-list?key=sk-798C6474993ec0be41081&q=$search'));

    if (response.statusCode == 200) {
      var json = response.body;
      return searchFromJson(json);
    } else {
      throw Exception('Failed to load species list');
    }
  }
}
void main() async {
  RemoteSearchService service = RemoteSearchService();

  try {
    SearchJason species = (await service.fetchSearchSpeciesList('Shinobuga Oka Japanese Maple')) as SearchJason;
    print(species.data.length);// Replace with the desired plant ID

    for (Datum plant in species.data) {
      print(plant.id);
    }


  } catch (e) {
    print('Error: $e');
  }
}
