import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/character.dart';

class FavoritesProvider with ChangeNotifier {
  List<Character> _favoriteCharacters = [];

  List<Character> get favoriteCharacters => _favoriteCharacters;

  void toggleFavorite(Character character) async {
    final prefs = await SharedPreferences.getInstance();
    if (_favoriteCharacters.contains(character)) {
      _favoriteCharacters.remove(character);
    } else {
      _favoriteCharacters.add(character);
    }
    notifyListeners();
    prefs.setStringList('favorites', _favoriteCharacters.map((char) => char.id.toString()).toList());
  }

  Future<void> loadFavorites(List<Character> allCharacters) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList('favorites') ?? [];
    _favoriteCharacters = allCharacters.where((char) => favoriteIds.contains(char.id.toString())).toList();
    notifyListeners();
  }
}
