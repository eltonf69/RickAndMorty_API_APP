import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/characters_provider.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterId = ModalRoute.of(context)!.settings.arguments as int;
    final character = Provider.of<CharactersProvider>(context).characters.firstWhere((char) => char.id == characterId);

    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(character.image),
            SizedBox(height: 10),
            Text(
              character.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Status: ${character.status}'),
            Text('Species: ${character.species}'),
            Text('Gender: ${character.gender}'),
            SizedBox(height: 10),
            Text('Episodes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...character.episode.map((ep) => ListTile(title: Text(ep))).toList(),
          ],
        ),
      ),
    );
  }
}
