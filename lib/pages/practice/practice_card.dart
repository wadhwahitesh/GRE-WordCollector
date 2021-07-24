import 'package:flutter/material.dart';
import 'package:word_collector/services/word.dart';
import 'package:flip_card/flip_card.dart';

class PracticeCard extends StatefulWidget {
  const PracticeCard({Key? key, required this.word, required this.wordKnown, required this.wordUnknown}) : super(key: key);
  final Function()  wordKnown;
  final Function() wordUnknown;
  final Word word;

  @override
  _PracticeCardState createState() => _PracticeCardState();
}

class _PracticeCardState extends State<PracticeCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlipCard(

        direction: FlipDirection.HORIZONTAL, // default
        front: Container(
          width: width,
          height: height / 3.3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 8,
                child: Center(
                    child: Text(
                  widget.word.word,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                )),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Colors.grey[300]),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Tap to flip",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        back: Container(
          //padding: EdgeInsets.all(10),
          width: width,
          height: height / 3,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.word.word,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '•${widget.word.meanings[0][1]}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15)),
                                color: Colors.red[200],
                              ),

                            child: TextButton.icon(
                                onPressed: widget.wordUnknown,
                                icon: Icon(Icons.close),
                                label: Text("I don't remember"),
                            style: TextButton.styleFrom(
                              primary: Colors.red[900],
                            ),)),
                      ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15)),
                              color: Colors.green[200],
                            ),

                            child: TextButton.icon(
                              onPressed: widget.wordKnown,
                              icon: Icon(Icons.check),
                              label: Text("I know this word"),
                              style: TextButton.styleFrom(
                                primary: Colors.green[900],
                              ),)),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
