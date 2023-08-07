import 'package:flutter/foundation.dart';

class NoteModel {
  var presentDate = DateTime.now();
  @required
  String id;
  @required
  String title;
  @required
  String body;
  NoteModel({
    this.title,
    this.body,
    this.id,
  });
}

class Notes with ChangeNotifier {
  List<NoteModel> _notes = [];

  List<NoteModel> get getAllNotes {
    return [..._notes];
  }

  NoteModel findNoteById(String id) {
    return _notes.firstWhere((element) => element.id == id);
  }

  void addNote(NoteModel note) {
    _notes.add(note);
    print(note.title);
    print(note.body);
    print(note.id);
    notifyListeners();
  }
}
