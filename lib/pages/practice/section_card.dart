import 'package:flutter/material.dart';
import 'package:word_collector/services/word.dart';

class SectionCard extends StatelessWidget {
  final int index;
  final int done, total;
  final Function() practiceSec;
  const SectionCard({Key? key, required this.index, required this.done, required this.total, required this.practiceSec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Section ${index+1}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            ),
            SizedBox(height: 20,),
            Text(
              " $done of $total mastered",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 17,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: done/total,
                backgroundColor: Colors.grey[300],
                color: Colors.green[600],
                minHeight: 20,
              ),
            ),
            SizedBox(height: 7,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: practiceSec,
                    child: Text("Practice Section"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
