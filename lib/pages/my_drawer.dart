import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              child: DrawerHeader(
                  child: Text("Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              ),
            ),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Search",
                style: TextStyle(
                  fontSize: 20,
                ),),
              ),

            ),
            Divider(height: 3, thickness: 2, indent: 20, endIndent: 0,),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("Practice",
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ),
            ),
            Divider(height: 3, thickness: 2, indent: 20, endIndent: 0,),
            ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text("View all words",
                  style: TextStyle(
                    fontSize: 20,
                  ),),
              ),
            ),
            Divider(height: 3, thickness: 2, indent: 20, endIndent: 0,),
          ],
        ),
      ),
    );
  }
}
