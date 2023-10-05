class PokemonModel {

  final String nome;
  final String url;

  PokemonModel(this.nome, this.url,);

  PokemonModel.fromJson(Map<String, dynamic> json) :
        nome= json['nome'],
        url= json['url'];

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'url': url,
  };
}