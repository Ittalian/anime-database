import 'dart:convert';

import 'package:anime_database/config/routes.dart';
import 'package:anime_database/utils/models/search_anime.dart';
import 'package:anime_database/views/widgets/base/base_button.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/base/base_textfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  String title = '';

  handleSearch() async {
    List<SearchAnime> searchResults = await search();
    // moveSearchResults(searchResults);
  }

  Future<List<SearchAnime>> search() async {
    List<SearchAnime> searchResultAnimes = [];
    final url = Uri.parse(
        'https://api.annict.com/v1/works?filter_season=2024-all&filter_title=$title&sort_watchers_count=desc');
    final headers = {
      'Authorization': 'Bearer 57DqAwityKGke0Zq7iWRdJPLbVzhfGumBcnx9pBCKhs',
    };
    try {
      final responce = await http.get(url, headers: headers);
      final resJson = json.decode(responce.body);
      final listData = resJson['works'];
      for (var data in listData) {
        SearchAnime anime = SearchAnime(
            animeTitle: data['title'],
            publicUrl: data['official_site_url'],
            xAccountUrl: data['wikipedia_url']);
        print(anime.animeTitle);
        searchResultAnimes.add(anime);
      }
    } catch (e) {
      print(e);
    }
    return searchResultAnimes;
  }

  moveSearchResults(List<SearchAnime> results) {
    Navigator.pushNamed(
      context,
      Routes.searchResult,
      arguments: results,
    );
  }

  setTitle(String value) {
    setState(() {
      title = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/search_background.jpg',
        child: Column(children: [
          BaseTextfield(label: 'アニメタイトル', setValue: (value) => setTitle(value)),
          BaseButton(label: '検索', onPressed: handleSearch),
        ]));
  }
}
