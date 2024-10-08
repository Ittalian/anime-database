import 'package:anime_database/config/routes.dart';
import 'package:anime_database/models/anime_particular.dart';
import 'package:anime_database/utils/widgets/loading_dialog.dart';
import 'package:anime_database/view_,models/anime_particular_view_model.dart';
import 'package:anime_database/views/widgets/base/base_button.dart';
import 'package:anime_database/views/widgets/base/base_image_container.dart';
import 'package:anime_database/views/widgets/base/base_numberfield.dart';
import 'package:anime_database/views/widgets/base/base_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  bool isExistAnimeParticular = false;

  @override
  void initState() {
    super.initState();
    setCurrentStory(widget.animeParticular.currentStory.toString());
    setLatestStory(widget.animeParticular.latestStory.toString());
    setDate(widget.animeParticular.dateId.toString());
    checkExistAnimeParticular();
  }

  checkExistAnimeParticular() {
    if (widget.animeParticular.currentStory != 0 &&
        widget.animeParticular.latestStory != 0) {
      isExistAnimeParticular = true;
    }
  }

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

  handleSave(AnimeParticularViewModel animeParticularViewModel) async {
    if (isExistAnimeParticular) {
      await animeParticularViewModel.updateAnimeParticular(
          widget.animeParticular.animeParticularId!,
          latestStory,
          currentStory,
          date);
    } else {
      await animeParticularViewModel.addAnimeParticular(AnimeParticular(
        animeId: widget.animeParticular.animeId,
        latestStory: latestStory,
        currentStory: currentStory,
        dateId: date,
      ));
    }
    await LoadingDialog.hide(context);
    moveAnimeIndex();
  }

  moveAnimeIndex() {
    Navigator.pushNamed(context, Routes.myAnimeIndex);
  }

  @override
  Widget build(BuildContext context) {
    final animeParticularViewModel = context.watch<AnimeParticularViewModel>();
    return Material(
        child: BaseImageContainer(
            imagePath: 'images/anime_particular.jpg',
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                isExistAnimeParticular
                    ? BaseNumberfield(
                        label: anime_particular.numerFieldText['latest']!,
                        initNumer:
                            widget.animeParticular.latestStory.toString(),
                        setValue: (value) => setLatestStory(value),
                        endText: anime_particular.endText)
                    : BaseNumberfield(
                        label: anime_particular.numerFieldText['latest']!,
                        setValue: (value) => setLatestStory(value),
                        endText: anime_particular.endText),
                const Padding(padding: EdgeInsets.only(left: 20)),
                isExistAnimeParticular
                    ? BaseNumberfield(
                        label: anime_particular.numerFieldText['current']!,
                        initNumer:
                            widget.animeParticular.currentStory.toString(),
                        setValue: (value) => setCurrentStory(value),
                        endText: anime_particular.endText)
                    : BaseNumberfield(
                        label: anime_particular.numerFieldText['current']!,
                        setValue: (value) => setCurrentStory(value),
                        endText: anime_particular.endText),
              ]),
              const Padding(padding: EdgeInsets.only(top: 20)),
              BaseSelect(
                  selectMap: anime_particular.dayOfWeek,
                  hintText: anime_particular.hintText,
                  initDate: date,
                  onSelected: (value) => setDate(value)),
              const Padding(padding: EdgeInsets.only(top: 20)),
              BaseButton(
                  label: '保存',
                  onPressed: () async {
                    await LoadingDialog.show(context, anime_particular.saving);
                    await handleSave(animeParticularViewModel);
                  })
            ])));
  }
}
