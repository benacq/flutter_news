//Accepts JSON data and parse it to a custom News object
class News {
  final String title;
  final String body;
  final String publisher;
  final String author;
  final String image;
  final String datePublished;

  //constructor
  News(
      {this.title,
      this.body,
      this.publisher,
      this.author,
      this.image,
      this.datePublished});


  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      body: json['text'],
      publisher: json['publisher'],
      author: json['author'],
      image: json['image'],
      datePublished: json['date'],
    );
  }
}
