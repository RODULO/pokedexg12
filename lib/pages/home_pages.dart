import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedexg12/apiservices/pokemon_api.dart';
import 'package:pokedexg12/pages/models/pokemon_reponse.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  late PokemonApi _pokemonApi;

  void initPokemonRestClient() {
    final dio = Dio(
      BaseOptions(responseType: ResponseType.plain) //forzamos a recibir un texto plano como lo recivimos en la api de pokemon
    );
    _pokemonApi = PokemonApi(dio);
  }

  @override
  void initState() {
    initPokemonRestClient();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            final response = await _pokemonApi.getPokemonList();
            final decoded = pokemonReponseFromJson(response.data);
            print(decoded.pokemon[1].name);
            _pokemonApi.getPokemonList(); 
          }
        ),
      ),
    );
  }
}