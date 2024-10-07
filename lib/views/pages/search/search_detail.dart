import 'package:anime_database/views/widgets/base/base_button.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/base/base_text.dart';
import 'package:anime_database/views/widgets/base/base_text_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/constants/search_detail_constants.dart' as search_detail;

class SearchDetail extends StatelessWidget {
  final String title;
  final String officialUrl;
  final String wikipediaUrl;

  const SearchDetail(
      {super.key, required this.title, required this.wikipediaUrl, required this.officialUrl});

  void showNothingMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text(search_detail.urlNotFoundErrorText),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ));
  }

  void renderOfficialSite(BuildContext context) {
    if (officialUrl == '') {
      showNothingMessage(context);
    } else {
      renderUrl(officialUrl);
    }
  }

  void renderWikipedia(BuildContext context) {
    if (wikipediaUrl == '') {
      showNothingMessage(context);
    } else {
      renderUrl(wikipediaUrl);
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
              BaseButton(
                  label: search_detail.labelText['public_site'].toString(), onPressed: () => renderOfficialSite(context)),
              BaseTextButton(
                  label: search_detail.labelText['wikipedia'].toString(),
                  onPressed: () => renderWikipedia(context)),
            ])));
  }
}
