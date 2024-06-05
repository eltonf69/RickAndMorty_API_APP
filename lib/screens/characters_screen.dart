import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/characters_provider.dart';
import '../widgets/character_item.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick and Morty Characters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).pushNamed('/favorites');
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<CharactersProvider>(context, listen: false).fetchCharacters(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<CharactersProvider>(
          builder: (ctx, charactersProvider, _) => ListView.builder(
            itemCount: charactersProvider.characters.length,
            itemBuilder: (ctx, i) => CharacterItem(charactersProvider.characters[i]),
          ),
        ),
      ),
    );
  }
}
