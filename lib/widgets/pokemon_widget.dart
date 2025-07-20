import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedexg12/pages/models/pokemon_reponse.dart';
import 'package:pokedexg12/pages/pokemon_detail_page.dart';

class PokemonWidget extends StatefulWidget {
  Pokemon pokemon;
  PokemonWidget(this.pokemon);

  @override
  State<PokemonWidget> createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget> {
    late Future<Color?> _dominantColor;

  Future <Color?> _getDominanColor(String urlImage) async {
    final imageProvider = NetworkImage(urlImage);
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      imageProvider,
    );
    return paletteGenerator.vibrantColor?.color;
  }

  @override
  void initState() {
    _dominantColor = _getDominanColor(widget.pokemon.img);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Color?>(
      future: _dominantColor,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final Color dominantColor = snapshot.data ?? Colors.white;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PokemonDetailPage(pokemon: widget.pokemon),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: dominantColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.pokemon.name),
                    Icon(Icons.favorite_border),
                  ],
                ),
                Expanded(
                  child: Image.network(widget.pokemon.img),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
