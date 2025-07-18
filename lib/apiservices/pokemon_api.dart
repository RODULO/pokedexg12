import 'package:pokedexg12/pages/models/pokemon_reponse.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'pokemon_api.g.dart';

@RestApi(
  baseUrl: "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/",
)
abstract class PokemonApi {
  factory PokemonApi(Dio dio, {String baseUrl}) = _PokemonApi;

  @GET("pokedex.json")
  Future<HttpResponse<String>> getPokemonList();

}