import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './Screens/Home_page.dart';
import './Screens/add_note_page.dart';
import './providers/note_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Notes(),
        )
      ],
      child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blueGrey),
          home: HomePage(),
          routes: {
            HomePage.pageName: (ctx) => HomePage(),
            AddNotePage.pageName: (ctx) => AddNotePage(),
          }),
    );
  }
}
