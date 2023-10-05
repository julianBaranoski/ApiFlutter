import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import '../models/PokemonModel.dart';
import '../services/PokemonService.dart';

class PokemonController extends GetxController {

  PokemonService pokemonService = PokemonService();  //instanciando o serviço
  var isLoading = false.obs;
  List<PokemonModel> pokemon = <PokemonModel>[].obs; //espera uma lista do tipo CharacterModel

  static PokemonController get pokemonSpotController => Get.find();

  Future<dynamic> listPokemon()  async {
    isLoading.value = true;
    var list = await pokemonService.fetchListPokemon();
    pokemon.addAll(list);
    isLoading.value = false;
    update();
    return pokemon;
  }



}
