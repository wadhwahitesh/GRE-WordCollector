import 'package:flutter/material.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:word_collector/services/word.dart';

class ExpandableCard extends StatelessWidget {
  final Word word;
  final Function() delete;
  final Function() showDetail;
  const ExpandableCard({Key? key, required this.word, required this.delete, required this.showDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  word.word,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserrat",
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_downward, color: Colors.grey[400],),
                      onPressed: showDetail,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.grey[400],),
                      onPressed: delete,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Text(
              word.meanings[0][1],
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
