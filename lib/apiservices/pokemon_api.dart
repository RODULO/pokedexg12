import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'pokemon_api.g.dart';

@RestApi(
  baseUrl: "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/",
)
abstract class PokemonApi {
  factory PokemonApi(Dio dio) = _PokemonApi;

}