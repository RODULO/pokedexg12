import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokedexg12/pages/models/pokemon_reponse.dart';
import 'package:pokedexg12/widgets/pokemon_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  
 

  final Pokemon pokemon;
  const PokemonDetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late Future<Color?> _dominantColor;
  Future<Color?> _getDominanColor(String urlImage) async {
    final imageProvider = NetworkImage(urlImage);
    final paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider,);
    return paletteGenerator.vibrantColor?.color;
  }

  @override
  void initState() {
    _dominantColor = _getDominanColor(widget.pokemon.img);
    super.initState();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder(
        future: _dominantColor,
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          }
          final Color dominantColor = asyncSnapshot.data ?? Colors.white;
          return Container(
            color: dominantColor.withOpacity(0.4),
            child: Column(
              children: [
                
                SizedBox(height: 20),
                Image.network(widget.pokemon.img, height: 150),
                SizedBox(height: 20),
                Text(widget.pokemon.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Wrap(
                  spacing: 8,
                  children: widget.pokemon.type
                      .map((type) => Chip(label: Text(type.toString().split('.').last)))
                      .toList(),
                ),
                Container(
                  
                  height: 530,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    color: Colors.white,
                  ) ,
                  child: Column(
                    children: [
                      Text(
                        "About",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      
                      SizedBox(height: 10),
                      Text(
                        "Poderes",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        //textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10),
                      
                      Wrap(
                        spacing: 8,
                        children: widget.pokemon.weaknesses
                            .map((type) => Chip(label: Text(type.toString().split('.').last)))
                            .toList(),
                        
                            
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Pokedex Data",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text("Height: ${widget.pokemon.height}"),
                      Text("Weight: ${widget.pokemon.weight}"),
                      Text("Candy: ${widget.pokemon.candy}"),
                      Text("Candy count: ${widget.pokemon.candyCount}"),
                      Text("Egg: ${widget.pokemon.egg.toString().split('.').last}"),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}