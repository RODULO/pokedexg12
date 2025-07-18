import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedexg12/pages/models/pokemon_reponse.dart'; 

class PokemonApiServiceHttp {
  String urlBase = 
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master//pokedex.json";
      
  Future<PokemonReponse?> getPokemonReponse() async {
    Uri url = Uri.parse(urlBase);
    http.Response response = await http.get(url);

    if(response.statusCode == 200) {
       Map<String, dynamic> data = json.decode(response.body);
       PokemonReponse pokemonReponse = PokemonReponse.fromJson(data);
       return pokemonReponse;
    } 
    return null;
  }
}