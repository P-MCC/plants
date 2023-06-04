import 'package:http/http.dart' as http;

import '../models/favorites_model.dart';


class RemoteFavoritesService{

  Future<Welcome2> fetchFavoriteSpeciesList(reqid) async {
    int id = reqid;
    final response = await http.get(Uri.parse('https://perenual.com/api/species/details/$id?key=sk-798C6474993ec0be41081'));

    if (response.statusCode == 200) {
      var json = response.body;
      return welcomeFromJson(json);
    } else {
      throw Exception('Failed to load species list');
    }
  }
}
void main() async {
  RemoteFavoritesService service = RemoteFavoritesService();

  try {
    Welcome2 species = await service.fetchFavoriteSpeciesList(123);
    print(species.id);// Replace with the desired plant ID


  } catch (e) {
    print('Error: $e');
  }
}
