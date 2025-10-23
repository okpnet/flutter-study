import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_theme/modules/theme_module.dart';
import 'package:flutter_theme/theme_factory.dart';

//final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);
final themeModule=ThemeModule();

void main() {
  runApp(
    //大概これをわすれて、No Prover scoped エラーがでる
    ProviderScope(
      child: const MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
      //themeMode: ref.watch(themeModeProvider),
      themeMode: themeModule.getMode(ref),
      darkTheme: ThemeFactory().darkTheme(),
      theme: ThemeFactory().lightTheme(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider=ref.watch(themeModeProvider);
    return Scaffold(
      //Appバーのバックグラウンドカラー設定を削除しないとthemeが反映されない
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(provider.toString()),
            ElevatedButton(
              onPressed: ()=>ref.read(themeModeProvider.notifier).state=ThemeMode.system, 
              child: const Text("system")
            ),
            ElevatedButton(
              onPressed: ()=>ref.read(themeModeProvider.notifier).state=ThemeMode.light, 
              child: const Text("light")
            ),
            ElevatedButton(
              onPressed: ()=>ref.read(themeModeProvider.notifier).state=ThemeMode.dark, 
              child: const Text("dark")
            ),
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            OutlinedButton(
              onPressed: (){
                final currentmode=ref.read(themeModeProvider);
                final value=currentmode == ThemeMode.light ? ThemeMode.dark :
                  currentmode == ThemeMode.dark ? ThemeMode.system : ThemeMode.light;
                ref.read(themeModeProvider.notifier).state=value;
              },
              child: const Text('change mode')),
          ],
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
