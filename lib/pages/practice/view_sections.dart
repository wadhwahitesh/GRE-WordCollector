import 'package:flutter/material.dart';
import 'package:word_collector/pages/practice/section_card.dart';
import 'package:word_collector/pages/practice/section_practice.dart';
import 'package:word_collector/services/word.dart';
import 'package:word_collector/pages/my_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiver/iterables.dart';

class ViewSections extends StatefulWidget {
  const ViewSections({Key? key}) : super(key: key);

  @override
  _ViewSectionsState createState() => _ViewSectionsState();
}

class _ViewSectionsState extends State<ViewSections> {
  @override
  Widget build(BuildContext context) {
    SharedPreferences prefs =
    ModalRoute
        .of(context)!
        .settings
        .arguments as SharedPreferences;
    List<Word> words;

    if (prefs.containsKey('words_data'))
      words = Word.decode(prefs.getStringList('words_data')!);
    else
      words = [];

    List<List<Word>> word_sections = partition(words, 40).toList();
   List<Map<String, int>> counts =  word_sections.map((section)=>Word.getCounts(section)).toList();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(
          "Practice Words",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Satisfy",
            fontSize: 27,
          ),
        ),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: word_sections.length,
        itemBuilder: (context, index) {
          return Padding(padding: EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            child: SectionCard(index: index, done: counts[index]['mastered']!, total: word_sections[index].length,
            practiceSec: () async {
              word_sections[index] = await Navigator.push(context,
              MaterialPageRoute(builder: (context)=>SectionPractice(words: word_sections[index])));
              setState(() {
                prefs.setStringList("words_data", Word.encode(word_sections.expand((element) => element).toList()));
              });
            },),
          );
        },
      ),
    );
  }
}
