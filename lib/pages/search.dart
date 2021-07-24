import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:word_collector/services/word.dart';
import 'package:word_collector/pages/word_card.dart';
import 'package:word_collector/pages/my_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<WordCard> cards = [];
  double top = 250;
  TextEditingController wordInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Word> all_words;
    SharedPreferences prefs = ModalRoute.of(context)!.settings.arguments as SharedPreferences;
    if(!MyDrawer.isInit) {
      MyDrawer.prefs = prefs;
      MyDrawer.isInit = true;

    }
    //prefs.remove('words_data');
    if(prefs.containsKey('words_data')){
      all_words = Word.decode(prefs.getStringList('words_data')!);
         //Word.decode(prefs.get('words_data') as String);
    }
    else
      all_words = [];
    //all_words = [];  //reset data

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.cyan,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "GRE WordCollector",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Satisfy",
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: wordInput,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter words',
                filled: true,
                fillColor: Colors.white,
                // suffixIcon: IconButton(
                //   onPressed: (){
                //     setState(() {
                //       if(wordInput.text!="")
                //         top = 60;
                //       String words = wordInput.text;
                //       getWordsFromInput();
                //       FocusManager.instance.primaryFocus!.unfocus();
                //     });
                //     },
                //   icon: Icon(Icons.search),
                //   ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.red, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: Colors.red),
                )),
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            onSubmitted: (String str) async {
              if (str.isNotEmpty) {
                List<String> words = str.split(' ');
                List<Word> wordss =
                    words.map((word) => Word(word: word)).toList();
                await Future.forEach(
                    wordss, (Word word) async => {await word.getData()});
                all_words += wordss;
                prefs.setStringList('words_data', Word.encode(all_words));
                //await Future.wait(wordss.forEach((element) async {await element.getData();}));
                //wordss.map((word) async => await word.getData());
                //words.map((word) => WordCard(word: word)).toList();
                setState(() {
                  top = 60;
                  cards = wordss.map((word) => WordCard(word: word)).toList();
                });
                wordInput.clear();
              }
            },
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: cards,
            ),
          )
        ],
      ),
    );
  }
}
