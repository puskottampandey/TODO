import 'package:flutter/material.dart';
import 'package:statemanagement/screens/additem_screen.dart';

import 'screens/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
      routes: {
        '/new-items': (context) => const NewContact(),
      },
    );
  }
}
