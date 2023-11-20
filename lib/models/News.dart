class News {
  Map<String, dynamic>? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishAt;
  String? content;
  //
  News(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishAt,
      this.content});

//default constructor
//
  factory News.fromJSON(Map<String, dynamic> map) {
    return News(
        source: map["source"],
        author: map["author"],
        title: map["title"],
        description: map["description"],
        url: map["url"],
        urlToImage: map["urlToImage"],
        publishAt: map["publishAt"],
        content: map["content"]);
  } //converting to object
}
