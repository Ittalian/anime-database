import 'package:anime_database/models/anime_particular.dart';
import 'package:anime_database/view_,models/anime_particular_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatefulWidget {
  final String animeId;
  const ProgressBar({super.key, required this.animeId});

  @override
  ProgressBarState createState() => ProgressBarState();
}

class ProgressBarState extends State<ProgressBar> {
  late Future<AnimeParticular?> animeParticular;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    animeParticular = getAnimeParticular();
  }

  Future<AnimeParticular?> getAnimeParticular() {
    final animeParticularViewModel = context.read<AnimeParticularViewModel>();
    return animeParticularViewModel.getAnimeParticularById(widget.animeId);
  }

  void _retry() {
    setState(() {
      animeParticular = getAnimeParticular();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AnimeParticular?>(
      future: animeParticular,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('エラーが発生しました: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('データが見つかりません');
        } else {
          final animeParticular = snapshot.data!;
          final latestStory = animeParticular.latestStory;
          final currentStory = animeParticular.currentStory;

          return Column(
            children: [
              Text('進捗：$currentStory話 / $latestStory話'),
              const Padding(padding: EdgeInsets.only(top: 10)),
              LinearProgressIndicator(
                value: latestStory > 0 ? currentStory / latestStory : 0,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ],
          );
        }
      },
    );
  }
}
