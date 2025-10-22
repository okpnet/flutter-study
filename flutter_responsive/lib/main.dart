import 'package:flutter/material.dart';
import 'package:flutter_responsive/login_page.dart';
import 'package:flutter_responsive/themes/custom_theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:responsive_framework/responsive_framework.dart';
void main() {
  //runApp(const MyApp());
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final themeprovider=CustomThemeProvider();
class MyApp extends ConsumerWidget  {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model=themeprovider.getModel(ref);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: model.lightTheme,
      darkTheme: model.darkTheme,
      themeMode: model.mode,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      builder: (context,child)=>ResponsiveBreakpoints.builder(
        child: child!, 
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ]),
    );
  } 
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends ConsumerState<MyHomePage> {
  final int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemLen=ResponsiveBreakpoints.of(context).isMobile ? 1 :
      ResponsiveBreakpoints.of(context).isTablet ? 3 :5;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      SingleChildScrollView(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '$itemLen',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Center(
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.green,
                          ),
                          child: const Center(
                              child: Text('Sidebar'),
                            ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.yellow,
                          ),
                        child:Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 16,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)
                                    )
                                  ),
                                  onPressed: () {
                                    themeprovider.setSystemTheme(ref);
                                  }, 
                                  child: const Text("System theme")
                                ),
                              ElevatedButton(
                                  onPressed: () {
                                    themeprovider.setLightTheme(ref);
                                  }, 
                                  child: const Text("Light theme")
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(),
                                  onPressed: () {
                                    themeprovider.setDarkThmeme(ref);
                                  }, 
                                  child: const Text("Dark theme")
                                ),
                            ],)
                        )
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          color: Colors.red,
                        ),
                      ),
                  ) 
                ],
              )
            ),
          ],
        ),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
