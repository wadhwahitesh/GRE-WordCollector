import 'package:flutter/material.dart';
import 'package:word_collector/pages/loading.dart';
import 'package:word_collector/pages/practice/section_practice.dart';
import 'package:word_collector/pages/practice/view_sections.dart';
import 'package:word_collector/pages/search.dart';
import 'package:word_collector/pages/view_words.dart';

void main() {
  runApp(MaterialApp(
    //initialRoute: '/view',
    routes:{
      '/': (context)=> Loading(),
      '/search': (context)=> Search(),
      '/view': (context)=>ViewWord(),
      '/practice': (context)=>ViewSections(),
    }
  ));
}



