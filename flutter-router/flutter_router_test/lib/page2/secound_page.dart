import 'package:flutter/material.dart';

class SecoundPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('secound page'),
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
            OutlinedButton(
              child: Text('page1'),
              onPressed: () 
              {
                Navigator.of(context).popUntil((Route<dynamic> x)=>x.isFirst);
                Navigator.of(context).pushNamed('/page1/firstpage');
              },
            ),
            BackButton(onPressed: () => Navigator.pop(context))
          ],
        ),
      ),
    );
  }

}