import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';

part 'word.g.dart';



@JsonSerializable()
class Word {
  static String wordUrl = 'https://www.dictionary.com/browse/';
  static String mnemonicUrl = 'https://mnemonicdictionary.com/?word=';
  late String word;
  late List<String> synonyms;
  late List<List<String>> meanings;
  late List<String> sentences;
  late String mnemonic;
  late int times;

  Word.fromSaved({required this.mnemonic, required this.sentences, required this.synonyms, required this.meanings, required this.word, required this.times});


  Word({required this.word}) {
    this.synonyms = ["tirade", "jeremiad", "spiel", "discourse"];
    this.meanings = [
      [
        'noun',
        'a scolding or a long or intense verbal attack; diatribe.',
        'a long, passionate, and vehement speech, especially one delivered before a public gathering.'
      ],
      [
        'verb (used with object), ha·rangued, ha·rangu·ing.',
        'to address in a harangue.'
      ],
      [
        'verb (used without object), ha·rangued, ha·rangu·ing.',
        'to deliver a harangue.'
      ]
    ];
    this.sentences = [
      "Just a few seconds on the receiving end of a harangue from such a fellow, whether at a surf break or the crag or the skin track, is enough to ruin an otherwise lovely day.",
      "Just a few seconds on the receiving end of a harangue from such a fellow, whether at a surf break or the crag or the skin track, is enough to ruin an otherwise lovely day."
    ];
    this.mnemonic =
        "HARANGUE can be split as har + ang + u + e....so when YOU are ANGry with HAR(her), she is subjected to a long or intensive verbal attack.";
    this.times = 0;
  }

  Future<void> getData() async {
    await Future.delayed(Duration(seconds: 1), () {
    });
  }

  void setUp() async {
    try {
      final WebScraper webScrapper = WebScraper(wordUrl);
      if (await webScrapper.loadWebPage(word)) {
        print(webScrapper.getElement(
            'div.css-1uqerbd e1hk9ate0 > div.css-10ul8x e1q3nk1v2', []));
      }
    } catch (e) {
      // TODO
      print(e.toString());
    }
  }

  static Map<String, int> getCounts(List<Word> words){
    int mastered=0, reviewing=0, fresh = 0;
    words.forEach((element) {
      if(element.times==0)
        fresh+=1;
      else if(element.times==5)
        mastered+=1;
      else
        reviewing+=1;
    });
    return {'mastered': mastered, 'reviewing': reviewing, 'fresh': fresh};

  }

  List<Widget> getCardContent(){

    final meanings_w = <Widget>[];
    final sentences_w = <Widget>[SizedBox(height: 20),Text("SENTENCES:",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),];

    List<Widget> mnemonic_w;
    String synonyms_w = '';
    List<Widget> synonym_w;

    for(int i = 0; i<meanings.length; i++){
      meanings_w.add(Text('${meanings[i][0]}',
        style: TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        ),
      )
      );
      for(int j = 1; j<meanings[i].length; j++)
        meanings_w.add(Text('•${meanings[i][j]}',
          style: TextStyle(
            fontSize: 16,
          ),));
    }

    for(int i = 0; i<synonyms.length - 1;i++)
      synonyms_w+='${synonyms[i]}, ';
    synonyms_w+=synonyms[synonyms.length-1];

    for(int i = 0; i<sentences.length;i++)
      sentences_w.add(
          Text(
            '${i+1}: ${sentences[i]}',
            style: TextStyle(
              fontSize: 15,
            ),
          )
      );

    mnemonic_w = <Widget>[SizedBox(height: 20),
      Text("Mnemonic",style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),),
      Text(mnemonic,
        style: TextStyle(
          fontSize: 15,
        ),)
    ];

    synonym_w = <Widget>[SizedBox(height: 20),
      Text("Synonyms",style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),),
      Text(
        synonyms_w,
        style: TextStyle(
          fontSize: 16,
        ),
      ),

    ];

    List<Widget> widgets= [
      Text(
        '${word}',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 20),
    ] + meanings_w +
        synonym_w + sentences_w
        +mnemonic_w;


    return widgets;
  }

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);

  static List<String> encode(List<Word> words){
    return words.map((word) => jsonEncode(word)).toList();
  }

  static List<Word> decode(List<String> words){
    return words.map((jsonD)=>Word.fromJson(jsonDecode(jsonD))).toList();
  }
  // factory Word.fromJson(Map<String, dynamic> jsonData){
  //   return Word.fromSaved(
  //     meanings: jsonData['meanings'],
  //     mnemonic: jsonData['mnemonic'],
  //     sentences: jsonData['sentences'],
  //     word: jsonData['word'],
  //     synonyms: jsonData['synonyms'],
  //   );
  // }

  // static Map<String, dynamic> toMap(Word word)=>{
  //   'meanings': word.meanings.cast<List<List<String>>>(),
  //   'mnemonic': word.mnemonic,
  //   'sentences': word.sentences,
  //   'synonyms': word.synonyms,
  //   'word': word.word,
  // };
  //
  // static String encode(List<Word> words)=>json.encode(
  //   words.map<Map<String, dynamic>>((word) => Word.toMap(word)).toList(),
  // );
  //
  // static List<Word> decode(String words) => (
  // json.decode(words) as List<dynamic>).map<Word>((word) => Word.fromJson(word)).toList();
}
