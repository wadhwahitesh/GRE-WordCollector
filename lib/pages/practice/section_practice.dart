
import 'package:flutter/material.dart';
import 'package:word_collector/services/word.dart';
import 'package:word_collector/pages/practice/practice_card.dart';

class SectionPractice extends StatefulWidget {
  const SectionPractice({Key? key, required this.words}) : super(key: key);
  final List<Word> words;
  @override
  _SectionPracticeState createState() => _SectionPracticeState();
}

class _SectionPracticeState extends State<SectionPractice> {
  late Map<String, Word> data = {};
  late List<Word> section;
  late int done, reviewing, total;
  late List<String> bagOfWords;
  String prevWord = '', currentWord = '';

  @override
  void initState() {
    // TODO: implement initState
    section = widget.words;
    section.forEach((element) {data[element.word]= element;});
    super.initState();
  }
  // List<Word> section = widget.words;
  @override
  Widget build(BuildContext context) {
    var counts = Word.getCounts(section);
    done = counts['mastered']!;
    reviewing = counts['reviewing']!;
    total = section.length;
    Word curWord = getWord();

    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context, section),
        ),
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
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PracticeCard(word: curWord,
            wordKnown: (){
            setState(() {
              if(curWord.times != 5)
                curWord.times+=1;
            });
            },
            wordUnknown: (){
            setState(() {
              curWord.times=0;
            });
            },
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[300],
                  color: Colors.green[700],
                  value: done/total,
                ),
              ),
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[300],
                  color: Colors.yellow[800],
                  value: reviewing/total,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

 Word getWord(){
    List<String> bagOfWords = [];
    data.forEach((key, value) {
      if(value.times == 0)
        bagOfWords+=List.filled(10, key);
      else if(value.times == 5)
        bagOfWords+=List.filled(1, key);
      else
        bagOfWords+=List.filled(4, key);
    });

    while(prevWord==currentWord)
      currentWord = (bagOfWords..shuffle()).first;

    prevWord = currentWord;
    return data[currentWord]!;



  }
}
