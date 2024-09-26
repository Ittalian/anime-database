import 'package:anime_database/views/widgets/base/base_button.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/base/base_text.dart';
import 'package:anime_database/views/widgets/base/base_text_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchDetail extends StatelessWidget {
  final String title;
  final String? officialUrl;
  final String? wikipediaUrl;

  const SearchDetail(
      {super.key, required this.title, this.wikipediaUrl, this.officialUrl});

  void renderOfficialSite() {
    if (officialUrl == null) {
      print('ありません');
    } else {
      renderUrl(officialUrl!);
    }
  }

  void renderWikipedia() {
    if (wikipediaUrl == null) {
      print('ありません');
    } else {
      renderUrl(wikipediaUrl!);
    }
  }

  renderUrl(String request) {
    final url = Uri.parse(request);
    launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return BaseImageContainer(
        imagePath: 'images/search_detail.jpg',
        child: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            body: Column(children: [
              BaseText(value: title, fontSize: 20),
              BaseButton(label: '公式サイト', onPressed: renderOfficialSite),
              BaseTextButton(label: 'wikipedia', onPressed: renderWikipedia),
            ])));
  }
}
