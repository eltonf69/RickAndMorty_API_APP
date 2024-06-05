import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorites_provider.dart';
import '../widgets/character_item.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteCharacters = Provider.of<FavoritesProvider>(context).favoriteCharacters;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Characters'),
      ),
      body: ListView.builder(
        itemCount: favoriteCharacters.length,
        itemBuilder: (ctx, i) => CharacterItem(favoriteCharacters[i]),
      ),
    );
  }
}
