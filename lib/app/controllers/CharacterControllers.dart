import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


import '../models/CharacterModel.dart';
import '../services/CharacterService.dart';

class CharacterController extends GetxController {
  CharacterService characterService = CharacterService();  //instanciando o serviço
  var isLoading = false.obs;
  List<CharacterModel> character = <CharacterModel>[].obs; //espera uma lista do tipo CharacterModel

  static CharacterController get characterSpotController => Get.find();

  Future<dynamic> listCharacter()  async {
    isLoading.value = true;
    var list = await characterService.fetchListCharacter();
    character.addAll(list);
    isLoading.value = false;
    update();
    return character;
  }



}
