

import 'package:flutter/material.dart';
import 'package:flutter_navigator_test/Page2/secound_page.dart';

class FirstPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Column(
          children: [
            OutlinedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (x)=>SecoundPage()
                  )
                );
              }, 
              child: const Text('次へ')),
            BackButton(
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
    );
  }
}