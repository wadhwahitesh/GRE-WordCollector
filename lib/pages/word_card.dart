import 'package:flutter/material.dart';
import 'package:word_collector/services/word.dart';

class WordCard extends StatelessWidget {
  const WordCard({
    Key? key,
  required this.word}) : super(key: key);

  final Word word;

  @override
  Widget build(BuildContext context) {
    final meanings = <Widget>[];
    final sentences = <Widget>[SizedBox(height: 20),Text("SENTENCES:",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),];

    List<Widget> mnemonic;
    String synonyms = '';
    List<Widget> synonym;

    for(int i = 0; i<word.meanings.length; i++){
      meanings.add(Text('${word.meanings[i][0]}',
      style: TextStyle(
        fontSize: 15,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
      )
      );
      for(int j = 1; j<word.meanings[i].length; j++)
        meanings.add(Text('•${word.meanings[i][j]}',
        style: TextStyle(
          fontSize: 16,
        ),));
    }

    for(int i = 0; i<word.synonyms.length - 1;i++)
      synonyms+='${word.synonyms[i]}, ';
    synonyms+=word.synonyms[word.synonyms.length-1];

    for(int i = 0; i<word.sentences.length;i++)
      sentences.add(
        Text(
          '${i+1}: ${word.sentences[i]}',
          style: TextStyle(
            fontSize: 15,
          ),
        )
      );

    mnemonic = <Widget>[SizedBox(height: 20),
      Text("Mnemonic",style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),),
      Text(word.mnemonic,
      style: TextStyle(
        fontSize: 15,
      ),)
    ];

    synonym = <Widget>[SizedBox(height: 20),
      Text("Synonyms",style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),),
      Text(
        synonyms,
        style: TextStyle(
          fontSize: 16,
        ),
      ),

    ];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.fromLTRB(10, 16, 10, 0),
      child: Padding(
        padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${word.word}',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
        SizedBox(height: 20),
        ] + meanings +
        synonym + sentences
        +mnemonic,
      ),
      ),
    );
  }
}

