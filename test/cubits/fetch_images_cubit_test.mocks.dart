// Mocks generated by Mockito 5.4.2 from annotations
// in imgur/test/bloc/fetch_images_cubit_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:imgur/common_models/image_model.dart' as _i4;
import 'package:imgur/infra/use_cases/add_favorites_use_case.dart' as _i5;
import 'package:imgur/infra/use_cases/fetch_images_use_case.dart' as _i2;
import 'package:imgur/infra/use_cases/search_image_use_case.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [FetchImagesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockFetchImagesUseCase extends _i1.Mock
    implements _i2.FetchImagesUseCase {
  MockFetchImagesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ImageModel>> call() => (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
        ),
        returnValue: _i3.Future<List<_i4.ImageModel>>.value(<_i4.ImageModel>[]),
      ) as _i3.Future<List<_i4.ImageModel>>);
}

/// A class which mocks [AddFavoritesUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockAddFavoritesUseCase extends _i1.Mock
    implements _i5.AddFavoritesUseCase {
  MockAddFavoritesUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i4.ImageModel> call(List<_i4.ImageModel>? images) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [images],
        ),
        returnValue: <_i4.ImageModel>[],
      ) as List<_i4.ImageModel>);
}

/// A class which mocks [SearchImageUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchImageUseCase extends _i1.Mock
    implements _i6.SearchImageUseCase {
  MockSearchImageUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ImageModel>> call(String? query) => (super.noSuchMethod(
        Invocation.method(
          #call,
          [query],
        ),
        returnValue: _i3.Future<List<_i4.ImageModel>>.value(<_i4.ImageModel>[]),
      ) as _i3.Future<List<_i4.ImageModel>>);
}
