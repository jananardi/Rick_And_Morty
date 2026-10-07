import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_model.dart';

class CharacterService {
  String url = "https://rickandmortyapi.com/api/character";
  dynamic _response;

  CharacterService() {
    _response = "";
  }

  Future<ListCharacterModel> fetchListCharacterModel() async {
    _response = await http.get(Uri.parse(url));

    if (_response.statusCode == 200) {
      Map<String, dynamic> retorno = jsonDecode(_response.body);
      return ListCharacterModel.fromJson(retorno);
    } else {
      throw Exception('Falhou ao Carregar!!!');
    }
  }
}
