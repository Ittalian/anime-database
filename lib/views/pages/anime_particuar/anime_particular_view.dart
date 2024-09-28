import 'package:anime_database/models/anime_particular.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/base/base_numberfield.dart';
import 'package:anime_database/views/widgets/base/base_select.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/anime_particular_constants.dart'
    as anime_particular;

class AnimeParticularView extends StatefulWidget {
  final AnimeParticular animeParticular;
  const AnimeParticularView({super.key, required this.animeParticular});

  @override
  AnimeParticularViewState createState() => AnimeParticularViewState();
}

class AnimeParticularViewState extends State<AnimeParticularView> {
  int date = 0;
  int latestStory = 0;
  int currentStory = 0;

  setDate(String value) {
    setState(() {
      date = int.parse(value);
    });
  }

  setLatestStory(String value) {
    setState(() {
      latestStory = int.parse(value);
    });
  }

  setCurrentStory(String value) {
    setState(() {
      currentStory = int.parse(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: BaseImageContainer(
            imagePath: 'images/anime_particular.jpg',
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                BaseNumberfield(
                    label: '最新', setValue: (value) => setLatestStory(value)),
                const Padding(padding: EdgeInsets.only(left: 20)),
                BaseNumberfield(
                    label: '現在', setValue: (value) => setCurrentStory(value))
              ]),
              const Padding(padding: EdgeInsets.only(top: 20)),
              BaseSelect(
                  selectMap: anime_particular.dayOdWeek,
                  hintText: anime_particular.hintText,
                  onSelected: (value) => setDate(value)),
            ])));
  }
}
