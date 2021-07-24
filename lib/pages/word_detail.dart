import 'package:flutter/material.dart';
import 'package:word_collector/pages/word_card.dart';
import 'package:word_collector/services/word.dart';

class WordDetail extends StatelessWidget {
  final Word word;
  const WordDetail({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.cyan,
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
      body: WordCard(word: word)
    );
  }
}
