import 'package:anime_database/config/routes.dart';
import 'package:anime_database/repositories/anime_repository.dart';
import 'package:anime_database/repositories/review_repository.dart';
import 'package:anime_database/services/anime_service.dart';
import 'package:anime_database/services/review_service.dart';
import 'package:anime_database/view_,models/anime_view_model.dart';
import 'package:anime_database/view_,models/review_view_model.dart';
import 'package:anime_database/views/pages/home.dart';
import 'package:firebase_core/firebase_core.dart';
import './config/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AnimeViewModel(AnimeRepository(AnimeService()))),
        ChangeNotifierProvider(
            create: (_) => ReviewViewModel(ReviewRepository(ReviewService()))),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
