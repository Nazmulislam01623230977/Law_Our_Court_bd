class LowDictionary {
  int id;
  String word;
  String answer;

  LowDictionary({
    required this.id,
    required this.word,
    required this.answer,
  });

  factory LowDictionary.fromJSON(Map map) {
    return LowDictionary(
      id: map['id'],
      word: map['word'],
      answer: map['answer'],
    );
  }

  // factory LowDictionary.fromJson(Map<String, dynamic> json) {
  //   return LowDictionary(name: json['name']);
  // }
}
