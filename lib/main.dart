import 'package:flutter/material.dart';
import 'package:statemanagement/screens/newcontact_screen.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
      routes: {
        '/new-contact': (context) => const NewContact(),
      },
    );
  }
}
