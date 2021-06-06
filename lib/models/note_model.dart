class Note {
  String title;
  String note;
  DateTime time;
  String id;
  Note({
    required this.title,
    required this.note,
    required this.time,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'note': note,
      'time': time.millisecondsSinceEpoch,
      "id": id,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      note: map['note'],
      time: DateTime.fromMillisecondsSinceEpoch(map['time']),
      id: map["id"],
    );
  }
}
