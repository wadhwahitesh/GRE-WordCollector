import 'package:flutter/material.dart';
import 'package:word_collector/pages/loading.dart';
import 'package:word_collector/pages/search.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/search',
    routes:{
      '/': (context)=> Loading(),
      '/search': (context)=> Search(),
    }
  ));
}



