import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child: Column(
        children: [
          AppBar(title: Text('Options')),
          ListTile(
            title: Text('All Notes'),
            onTap: () => Navigator.of(context).pushReplacementNamed('/'),
          ),
          Divider(),
          ListTile(
            title: Text('Work'),
          ),
          Divider(),
          ListTile(
            title: Text('Home'),
          ),
          Divider(),
          ListTile(
            title: Text('Todos'),
          ),
          Divider(),
          ListTile(
            title: Text('Recently Deleted'),
          ),
        ],
      ),
    );
  }
}
