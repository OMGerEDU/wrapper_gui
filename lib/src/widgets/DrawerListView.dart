//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Downloader.dart';
import '../../main.dart';

class DrawerListView extends StatelessWidget {
  const DrawerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Navigation Panel'),
        ),
        ListTile(
          title: const Text('Home page'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home',))
            );
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Downloader'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Downloader())
            );
            // Update the state of the app.
            // ...
          },
        ),
      ],
    );
  }
}