//import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:word_collector/pages/my_drawer.dart';
import 'package:word_collector/pages/word_detail.dart';
import 'package:word_collector/services/word.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:word_collector/pages/expandable_cards.dart';

class ViewWord extends StatefulWidget{
  const ViewWord({Key? key}) : super(key: key);

  @override
  _ViewWordState createState() => _ViewWordState();


}

class _ViewWordState extends State<ViewWord> {


  @override
  Widget build(BuildContext context){
    SharedPreferences prefs = ModalRoute.of(context)!.settings.arguments as SharedPreferences;
    List<Word> words;

    if(prefs.containsKey('words_data'))
      words = Word.decode(prefs.getStringList('words_data')!);
    else
      words = [];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(
          "All Words",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Satisfy",
            fontSize: 27,
          ),
        ),
        centerTitle: true,
      ),

      drawer: MyDrawer(),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: words.map((word)=>ExpandableCard(word: word,
        delete: (){
          setState(() {
            words.remove(word);
            prefs.setStringList("words_data", Word.encode(words));
          });
        },
        showDetail: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => WordDetail(word: word)),);
        }
        )).toList(),
      ),
    );
  }

}

