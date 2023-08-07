import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_model.dart';

class AddNotePage extends StatefulWidget {
  static final String pageName = '/addNotePage';

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final _formKey = GlobalKey<FormState>();

  String _noteTitle = '';

  String _content = '';

  void _saveNote(BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final newNote = new NoteModel(
        id: DateTime.now().toString(), body: _content, title: _noteTitle);
    Provider.of<Notes>(context, listen: false).addNote(newNote);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Input a valid tile';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _noteTitle = value;
                    },
                  )),
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Content'),
                    maxLines: 5,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Input some content';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _content = value;
                    },
                  ))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveNote(context);
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
