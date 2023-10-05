import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:rickandmortyapi/app/controllers/PokemonControllers.dart';

import 'app/controllers/CharacterControllers.dart';




class ControllerBinding implements Bindings  {
  @override
  void dependencies(){
    // Get.lazyPut<CharacterController>(() => CharacterController());
    // Get.lazyPut<ThemeController>(() => ThemeController());
    Get.lazyPut<PokemonController>(() => PokemonController());
  }

}