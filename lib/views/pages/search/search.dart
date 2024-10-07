import 'dart:convert';

import 'package:anime_database/config/routes.dart';
import 'package:anime_database/utils/models/search_anime.dart';
import 'package:anime_database/views/widgets/base/base_button.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/base/base_numberfield.dart';
import 'package:anime_database/views/widgets/base/base_radio_button.dart';
import 'package:anime_database/views/widgets/base/base_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  Map<String, String> seasons = {
    '春': 'spring',
    '夏': 'summer',
    '秋': 'autumn',
    '冬': 'winter'
  };
  String selectedSeason = '';
  String year = '';
  String title = '';

  @override
  void initState() {
    super.initState();
    selectedSeason = seasons.entries.first.value;
    setYear((DateTime.now().year + 1).toString());
  }

  handleSearch() async {
    List<SearchAnime> searchResults = await search();
    moveSearchResults(searchResults);
  }

  Future<List<SearchAnime>> search() async {
    List<SearchAnime> searchResultAnimes = [];
    String request =
        'https://api.annict.com/v1/works?sort_watchers_count=desc&filter_season=$year-$selectedSeason';

    if (title.isNotEmpty) {
      String titleOption = '&filter_title=$title';
      request += titleOption;
    }

    final url = Uri.parse(request);

    final headers = {
      'Authorization': 'Bearer ${dotenv.get('access_token')}',
    };

    try {
      final responce = await http.get(url, headers: headers);
      final resJson = json.decode(responce.body);
      final listData = resJson['works'];
      for (var data in listData) {
        SearchAnime anime = SearchAnime(
          title: data['title'] as String,
          episodeCount: data['episodes_count'] as int,
          wikipeidaUrl: data['wikipedia_url'] ?? '',
          officialSiteUrl: data['official_site_url'] ?? '',
          imageUrl: data['images']['facebook']['og_image_url'] ?? '',
        );
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
      arguments: {
        'animes': results,
      },
    );
  }

  setTitle(String value) {
    setState(() {
      title = value;
    });
  }

  setSeason(String select) {
    setState(() {
      selectedSeason = select;
    });
  }

  setYear(String value) {
    setState(() {
      year = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/search_background.jpg',
        child: Column(children: [
          BaseTextfield(label: 'アニメタイトル', setValue: (value) => setTitle(value)),
          BaseNumberfield(
              label: '放送年',
              initNumer: (DateTime.now().year + 1).toString(),
              setValue: (value) => setYear(value),
              endText: '年'),
          BaseRadioButton(
              selectMap: seasons, onSelected: (select) => setSeason(select)),
          BaseButton(label: '検索', onPressed: handleSearch),
        ]));
  }
}
