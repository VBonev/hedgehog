import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/repositories/fetch_images_repository_mock.dart';
import 'feature_images_overview/bloc/fetch_images_cubit.dart';
import 'feature_images_overview/ui/images_overview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imgur Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => FetchImagesCubit(FetchImagesRepositoryMock()),
          child: const ImagesOverviewPage()),
    );
  }
}
