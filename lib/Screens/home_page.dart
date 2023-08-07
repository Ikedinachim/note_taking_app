import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/note_model.dart';
import './add_note_page.dart';
import '../widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  static final String pageName = '/homePage';
  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<Notes>(context).getAllNotes;
    return Scaffold(
      body: FloatingSearchBar.builder(
          drawer: AppDrawer(),
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text(notes[index].title),
              subtitle: Text((notes[index].presentDate.toString())),
              trailing: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                      IconButton(icon: Icon(Icons.delete), onPressed: () {}),
                    ],
                  )),
            );
          },
          itemCount: notes.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(AddNotePage.pageName),
        child: Icon(Icons.add),
      ),
    );
  }
}
