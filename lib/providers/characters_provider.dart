import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/character.dart';

class CharactersProvider with ChangeNotifier {
  List<Character> _characters = [];
  bool _isLoading = false;

  List<Character> get characters => _characters;
  bool get isLoading => _isLoading;

  Future<void> fetchCharacters() async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://rickandmortyapi.com/api/character');
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);

      List<Character> loadedCharacters = [];
      data['results'].forEach((charData) {
        loadedCharacters.add(Character.fromJson(charData));
      });

      _characters = loadedCharacters;
    } catch (error) {
      throw (error);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
