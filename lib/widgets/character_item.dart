import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../providers/favorites_provider.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem(this.character, {super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.favoriteCharacters.contains(character);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(character.image),
      ),
      title: Text(character.name),
      subtitle: Text(character.species),
      trailing: IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          favoritesProvider.toggleFavorite(character);
        },
      ),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/character-detail',
          arguments: character.id,
        );
      },
    );
  }
}
