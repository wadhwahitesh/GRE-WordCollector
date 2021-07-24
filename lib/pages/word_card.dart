import 'package:flutter/material.dart';
import 'package:word_collector/services/word.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    Key? key,
  required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {


    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.fromLTRB(10, 16, 10, 0),
      child: Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: word.getCardContent()
        // [
        //   Text(
        //       '${word.word}',
        //   style: TextStyle(
        //     fontSize: 30,
        //     fontWeight: FontWeight.bold,
        //     color: Colors.black,
        //   ),
        //   ),
        // SizedBox(height: 20),
        // ] + meanings +
        // synonym + sentences
        // +mnemonic,
      ),
      ),
    );
  }
}

