import '../feature_images_overview/repository/fetch_images_repository.dart';

class FetchImagesRepositoryMock extends FetchImagesRepository {
  final images = [
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Bushy-Monster-cartoon-character-alien-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Cute-Small-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Four-Arms-Horn-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Smile-Horn-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Big-Horn-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Wide-Eyes-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Wide-Face-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/A-Shape-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Pointy-Ears-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Square-Horn-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Wide-Horn-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Blob-Monster-cartoon-character-alien-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Devil-Monster-cartoon-character-alien-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Flying-Slug-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Rectangle-Monster-cartoon-character-alien-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Circle-Monster-cartoon-character-alien-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Snail-Monster-cartoon-character-alien-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/French-Fry-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Siamese-Monster-cartoon-character-alien-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Slug-Blob-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Bat-Wing-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Big-Arm-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Big-Eye-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Five-Eye-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Hammer-Monster-cartoon-character-alien-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Hippo-Face-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Long-Neck-Monster-cartoon-character-1024.png',
    'https://cdn2.iconfinder.com/data/icons/cute-monsters-soft-fill/60/Bent-Horns-Monster-cartoon-character-1024.png',
  ];

  @override
  Future<List<String>> getPopularImages() {
    return Future.value(images);
  }

  @override
  Future<List<String>> searchImage(String query) {
    return Future.value([images.first]);
  }
}
