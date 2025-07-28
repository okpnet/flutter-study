import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('home'),
              onPressed: () 
              {
                Navigator.of(context).pushNamed('/');
              },
            ),
            ElevatedButton(
              child: Text('page2'),
              onPressed: ()
              {
                Navigator.of(context).pushNamed('/page2/secoundpage');
              }
            ),
            BackButton(onPressed: () => Navigator.pop(context))
          ]
        ),
      ),
    );
  }

}