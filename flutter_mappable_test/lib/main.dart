import 'package:flutter/material.dart';
import 'package:flutter_mappable_test/custom_theme_model.dart';
import 'package:flutter_mappable_test/custom_theme_option.dart';
import 'package:flutter_mappable_test/theme_factory.dart';
import 'package:flutter_mappable_test/themes/pair_theme_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider=StateProvider((ref)=>CustomThemeModel());
final themeDataProvider=StateProvider((ref)=>PairThemeData(
  light: ThemeData.light(),
  dark: ThemeData.dark(),
));
final themeChangeProvider=FutureProvider<PairThemeData>((ref) async {
  final themeModel=ref.watch(themeProvider);
  final themeData=await ThemeFactory.createThemeData(themeModel.selectedOption);
  ref.read(themeDataProvider.notifier).state=themeData;
  return themeData;
});

void main() {
  runApp(
    const ProviderScope(
      child:MyApp(),
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeData = ref.watch(themeDataProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: themeData.dark,
      theme: themeData.light,
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
    final themeDataAsync=ref.watch(themeChangeProvider);
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:  themeDataAsync.maybeWhen(
          loading: ()=> const Center(child: CircularProgressIndicator()),
          orElse: () => const Center(child: Text('Error loading theme')),
          data: (data) => Center(
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                RadioGroup(
                  groupValue: ref.watch(themeProvider).selectedOption,
                  onChanged: (v) => ref.read(themeProvider.notifier).state=CustomThemeModel().copyWith(selectedOption: v),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile(
                        value: CustomThemeOption.system,
                        title:const Text('System'),
                        subtitle: const Text('Follow system theme'),
                        ),
                      RadioListTile(
                        value: CustomThemeOption.pink,
                        title:const Text('Pink'),
                        subtitle: const Text('Follow pink theme'),
                        ),
                      RadioListTile(
                        value: CustomThemeOption.blue,
                        title: const Text('Blue'),
                        subtitle: const Text('Follow blue theme'),
                      ),
                      RadioListTile(
                        value: CustomThemeOption.green,
                        title: const Text('Green'),
                        subtitle: const Text('Follow green theme'),
                      ),
                    ],
                  )
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
