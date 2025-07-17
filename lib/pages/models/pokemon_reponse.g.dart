// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_reponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonReponse _$PokemonReponseFromJson(Map<String, dynamic> json) =>
    PokemonReponse(
      pokemon:
          (json['pokemon'] as List<dynamic>)
              .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$PokemonReponseToJson(PokemonReponse instance) =>
    <String, dynamic>{'pokemon': instance.pokemon};

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
  id: (json['id'] as num).toInt(),
  num: json['num'] as String,
  name: json['name'] as String,
  img: json['img'] as String,
  type:
      (json['type'] as List<dynamic>)
          .map((e) => $enumDecode(_$TypeEnumMap, e))
          .toList(),
  height: json['height'] as String,
  weight: json['weight'] as String,
  candy: json['candy'] as String,
  candyCount: (json['candyCount'] as num?)?.toInt(),
  egg: $enumDecode(_$EggEnumMap, json['egg']),
  spawnChance: (json['spawnChance'] as num).toDouble(),
  avgSpawns: (json['avgSpawns'] as num).toDouble(),
  spawnTime: json['spawnTime'] as String,
  multipliers:
      (json['multipliers'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
  weaknesses:
      (json['weaknesses'] as List<dynamic>)
          .map((e) => $enumDecode(_$TypeEnumMap, e))
          .toList(),
  nextEvolution:
      (json['nextEvolution'] as List<dynamic>?)
          ?.map((e) => Evolution.fromJson(e as Map<String, dynamic>))
          .toList(),
  prevEvolution:
      (json['prevEvolution'] as List<dynamic>?)
          ?.map((e) => Evolution.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
  'id': instance.id,
  'num': instance.num,
  'name': instance.name,
  'img': instance.img,
  'type': instance.type.map((e) => _$TypeEnumMap[e]!).toList(),
  'height': instance.height,
  'weight': instance.weight,
  'candy': instance.candy,
  'candyCount': instance.candyCount,
  'egg': _$EggEnumMap[instance.egg]!,
  'spawnChance': instance.spawnChance,
  'avgSpawns': instance.avgSpawns,
  'spawnTime': instance.spawnTime,
  'multipliers': instance.multipliers,
  'weaknesses': instance.weaknesses.map((e) => _$TypeEnumMap[e]!).toList(),
  'nextEvolution': instance.nextEvolution,
  'prevEvolution': instance.prevEvolution,
};

const _$TypeEnumMap = {
  Type.BUG: 'BUG',
  Type.DARK: 'DARK',
  Type.DRAGON: 'DRAGON',
  Type.ELECTRIC: 'ELECTRIC',
  Type.FAIRY: 'FAIRY',
  Type.FIGHTING: 'FIGHTING',
  Type.FIRE: 'FIRE',
  Type.FLYING: 'FLYING',
  Type.GHOST: 'GHOST',
  Type.GRASS: 'GRASS',
  Type.GROUND: 'GROUND',
  Type.ICE: 'ICE',
  Type.NORMAL: 'NORMAL',
  Type.POISON: 'POISON',
  Type.PSYCHIC: 'PSYCHIC',
  Type.ROCK: 'ROCK',
  Type.STEEL: 'STEEL',
  Type.WATER: 'WATER',
};

const _$EggEnumMap = {
  Egg.NOT_IN_EGGS: 'NOT_IN_EGGS',
  Egg.OMANYTE_CANDY: 'OMANYTE_CANDY',
  Egg.THE_10_KM: 'THE_10_KM',
  Egg.THE_2_KM: 'THE_2_KM',
  Egg.THE_5_KM: 'THE_5_KM',
};

Evolution _$EvolutionFromJson(Map<String, dynamic> json) =>
    Evolution(num: json['num'] as String, name: json['name'] as String);

Map<String, dynamic> _$EvolutionToJson(Evolution instance) => <String, dynamic>{
  'num': instance.num,
  'name': instance.name,
};
