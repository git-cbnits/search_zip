import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_zip/application/search_zip/search_zip_bloc.dart';
import 'package:search_zip/presentation/search_zip/search_zip_screen.dart';

import 'locator.dart';

Future<void> main() async{
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Zip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => locator<SearchZipBloc>(),
        child: SearchZipScreen(),
      ),
    );
  }
}
