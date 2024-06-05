import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/characters_screen.dart';
import './screens/character_detail_screen.dart';
import './providers/characters_provider.dart';
import './providers/favorites_provider.dart';
import './screens/favorites_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'Rick and Morty',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: CharactersScreen(),
        routes: {
          '/character-detail': (ctx) => CharacterDetailScreen(),
          '/favorites': (ctx) => FavoritesScreen(),
        },
      ),
    );
  }
}
