import 'package:flutter/material.dart';

class SecoundPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
        return Scaffold(
      appBar: AppBar(
          title: Text('Secound page'),
        ),
      body: Column(
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('もどーる'),
            ),
          ],
        ),
      );
  }

}