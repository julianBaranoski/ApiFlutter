import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rickandmortyapi/app/controllers/PokemonControllers.dart';


import '../components/ImageHero.dart';
import '../controllers/CharacterControllers.dart';
import 'details.dart';

class MyPokemonPage extends StatefulWidget {
  const MyPokemonPage({super.key, required this.title});

  final String title;

  @override
  State<MyPokemonPage> createState() => _MyPokemonPage();
}

class _MyPokemonPage extends State<MyPokemonPage> {

  var controller = PokemonController.pokemonSpotController;
  //orientado a eventos

  @override
  void initState() {
    //Exececuta antes de abrir a tela
    super.initState();
    controller.listPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Obx(() => controller.isLoading.value // se o controle for falso
            ? const Center(child: CircularProgressIndicator())  // exibe um reaload na tela
            : Container(  // se não mostra a lista na tela.
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: controller.pokemon.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => DetailsPage(image: controller
                        //             .pokemon[index].nome, name: controller
                        //             .pokemon[index].url,),)
                        //   );
                        // },
                        // leading:  ImageHero(controller
                        //     .pokemon[index].nome, 60.0)
                        // ,
                        title: Text(controller.pokemon[index].nome),
                        subtitle: Text(controller.pokemon[index].url),
                      ),

                    ],
                  ),
                );
              }),
        ))
    );
  }
}