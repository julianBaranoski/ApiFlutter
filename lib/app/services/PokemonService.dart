import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rickandmortyapi/app/models/PokemonModel.dart';

import 'dart:developer';

class PokemonService{

  String urlGetList = "https://pokeapi.co/api/v2/pokemon/";

  dynamic _response; // _ na frente da variavel diz que a variavel é privada

  Future<dynamic> fetchListPokemon() async {
    _response = await http.get(Uri.parse(urlGetList)); // converte a string em uma url.
    if (_response.statusCode == 200) {

      var list = json.decode(_response.body);
      List<PokemonModel> listPokemonModel = [];
      for (var item in list["results"]) {
        listPokemonModel.add((PokemonModel.fromJson(item)));
      }

      //return ParkingSpotList.fromJson(list);
      return listPokemonModel;
    } else {
      throw Exception('Failed to load cote');
    }
  }
}