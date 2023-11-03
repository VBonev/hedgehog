import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/feature_images_overview/repository/fetch_images_repository.dart';
import 'package:imgur/repositories/fetch_images_repository_impl.dart';
import 'package:imgur/repositories/fetch_images_repository_mock.dart';
import 'package:imgur/use_cases/get_images_use_case.dart';
import 'package:imgur/use_cases/search_image_use_case.dart';
import 'package:network/client/client.dart';

import 'feature_images_overview/bloc/fetch_images_cubit.dart';
import 'feature_images_overview/ui/images_overview_page.dart';
import 'strings.dart';

class ImgurApp extends StatelessWidget {
  const ImgurApp({
    this.baseUrl,
    super.key,
  });

  final String? baseUrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
          create: (context) => FetchImagesCubit(
                getImageUseCase: GetImagesUseCase(
                  _getRepository(),
                ),
                searchImageUseCase: SearchImageUseCase(
                  _getRepository(),
                ),
              ),
          child: const ImagesOverviewPage()),
    );
  }

  FetchImagesRepository _getRepository({String? baseUrl}) {
    return baseUrl != null
        ? FetchImagesRepositoryImpl(client: NetworkClient(baseUrl))
        : FetchImagesRepositoryMock();
  }
}
