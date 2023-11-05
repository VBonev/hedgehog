class ImageModel {
  ImageModel({
    this.id,
    this.link,
    this.title,
    this.views,
    this.isFavorite,
    this.ups,
    this.downs,
    this.points,
    this.score,
  });

  @override
  bool operator ==(Object other) =>
      other is ImageModel &&
      other.id == id &&
      other.link == link &&
      other.title == title &&
      other.views == views &&
      other.isFavorite == isFavorite &&
      other.ups == ups &&
      other.downs == downs &&
      other.points == points &&
      other.score == score;

  @override
  int get hashCode => id.hashCode;

  final String? id;
  final String? link;
  final String? title;
  final int? views;
  bool? isFavorite;
  final int? ups;
  final int? downs;
  final int? points;
  final int? score;
}
