class CalendPhoto {
  int id;
  String avater;

  CalendPhoto({
    required this.id,
    required this.avater,
  });

  factory CalendPhoto.fromJSON(Map map) {
    return CalendPhoto(id: map['id'], avater: map['avater']);
  }
}
