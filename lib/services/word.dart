import 'package:url_launcher/url_launcher.dart';
import 'package:web_scraper/web_scraper.dart';
import 'dart:convert';

class Word {
  static String wordUrl = 'https://www.dictionary.com/browse/';
  static String mnemonicUrl = 'https://mnemonicdictionary.com/?word=';
  late String word;
  late List<String> synonyms;
  late List<List<String>> meanings;
  late List<String> sentences;
  late String mnemonic;

  Word.fromSaved({required this.mnemonic, required this.sentences, required this.synonyms, required this.meanings, required this.word});


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
  }

  Future<void> getData() async {
    await Future.delayed(Duration(seconds: 3), () {
      print("jgvjghjhghghghghghghghg");
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

  factory Word.fromJson(Map<String, dynamic> jsonData){
    return Word.fromSaved(
      meanings: jsonData['meanings'],
      mnemonic: jsonData['mnemonic'],
      sentences: jsonData['sentences'],
      word: jsonData['word'],
      synonyms: jsonData['synonyms'],
    );
  }

  static Map<String, dynamic> toMap(Word word)=>{
    'meanings': word.meanings,
    'mnemonic': word.mnemonic,
    'sentences': word.sentences,
    'synonyms': word.synonyms,
    'word': word.word,
  };

  static String encode(List<Word> words)=>json.encode(
    words.map<Map<String, dynamic>>((word) => Word.toMap(word)).toList(),
  );

  static List<Word> decode(String words) => (
  json.decode(words) as List<dynamic>).map<Word>((word) => Word.fromJson(word)).toList();
}
