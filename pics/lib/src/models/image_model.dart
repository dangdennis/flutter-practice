class ImageModel {
  int id;
  String url;
  String title;

  ImageModel(this.id, this.url, this.title);

  ImageModel.fromJson(Map<String, dynamic> parsed) {
    id = parsed['id'];
    url = parsed['url'];
    title = parsed['title'];
  }
}
