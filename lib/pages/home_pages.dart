import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedexg12/apiservices/pokemon_api.dart';
import 'package:pokedexg12/apiservices/pokemon_api_service_http.dart';
import 'package:pokedexg12/pages/models/pokemon_reponse.dart';
import 'package:pokedexg12/widgets/pokemon_widget.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  late PokemonApi _pokemonApi;
  PokemonReponse? _pokemonReponse; 

  void initPokemonRestClient() {
    final dio = Dio(
      BaseOptions(
        responseType: ResponseType.plain
      ) //forzamos a recibir un texto plano como lo recivimos en la api de pokemon
    );
    _pokemonApi = PokemonApi(dio);
  }

  Future<void> fetchPokemonReponse() async {
    _pokemonReponse = await PokemonApiServiceHttp().getPokemonReponse();
    setState(() {});
  }

  @override
  void initState() {
    initPokemonRestClient();
    fetchPokemonReponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            // final response = await _pokemonApi.getPokemonList();
            // final decoded = pokemonReponseFromJson(response.data);
            // print(decoded.pokemon[1].name);
            final PokemonReponse? pokemones = await PokemonApiServiceHttp()
              .getPokemonReponse();
            print(pokemones!.pokemon[0].name);
          },
        ),
        body:_pokemonReponse == null
            ?Center(child: CircularProgressIndicator(),)
            :Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "tu pokedex",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    ),
                  Text(
                    "¿Quien es ese pokemon? Busca el pokemon de tu preferencia y observa sus cualidades" 
                  ),
                  Expanded(
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.93
                      ),
                      children: _pokemonReponse!.pokemon
                          .map((pokemon) => PokemonWidget(pokemon))
                          .toList(),
                  ))
                ],
              ),
            ),
      ),
    );
  }
}