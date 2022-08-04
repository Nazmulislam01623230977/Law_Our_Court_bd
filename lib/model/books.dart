class BooksModel {
  int id;
  String title;
  String pdf;

  BooksModel({
    required this.id,
    required this.title,
    required this.pdf,
  });

  factory BooksModel.fromJSON(Map map) {
    return BooksModel(
      id: map['id'],
      title: map['title'],
      pdf: map['pdf'],
    );
  }

  // factory LowDictionary.fromJson(Map<String, dynamic> json) {
  //   return LowDictionary(name: json['name']);
  // }
}
