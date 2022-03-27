import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/ui_helper.dart';

import '../model/pokemon_model.dart';

class PokeImage extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            width: UIHelper.calculatePokeImg(),
            height: UIHelper.calculatePokeImg(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) => Icon(Icons.ac_unit),
              width: UIHelper.calculatePokeImg(),
              height: UIHelper.calculatePokeImg(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
