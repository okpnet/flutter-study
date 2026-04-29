import 'package:flutter/material.dart';
import 'package:responsive_test/responsive/ut_responsive_flex.dart';
import 'package:responsive_test/responsive/ut_responsive_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        child: UtResponsiveGrid(
          spacing: 5,
          children: [
            UtResponsiveFlex.of(
              flex: 1,
              mobile: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.brown),
                child: Text('1'),
              ),
            ),
            //UtResponsiveFlex(flex: 3, cr: true, child: Text('2')),
            UtResponsiveFlex.of(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.redAccent),
                child: Text('2'),
              ),
            ),
            UtResponsiveFlex.of(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.purple),
                child: Text('3'),
              ),
            ),
            UtResponsiveFlex.of(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('4'),
              ),
            ),
            UtResponsiveFlex.cr(),
            UtResponsiveFlex.of(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(color: Colors.blueGrey),
                child: Text('5'),
              ),
            ),
            UtResponsiveFlex.of(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(color: Colors.green),
                child: Text('6'),
              ),
            ),
            UtResponsiveFlex.of(
              flex: 7,
              mobile: 3,
              smallPc: 12,
              smallTablet: 4,
              child: Container(
                decoration: BoxDecoration(color: Colors.lightGreen),
                child: Text('7'),
              ),
            ),
            UtResponsiveFlex.cr(hidePoint: .smallPc),
            UtResponsiveFlex.of(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(color: Colors.yellow),
                child: Text('4'),
              ),
            ),
            UtResponsiveFlex.of(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(color: Colors.orange),
                child: Text('4'),
              ),
            ),
            UtResponsiveFlex.of(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Text('3'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
