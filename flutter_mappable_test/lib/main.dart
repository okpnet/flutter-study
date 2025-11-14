import 'package:flutter/material.dart';
import 'package:flutter_mappable_test/options/custom_theme_option.dart';
import 'package:flutter_mappable_test/themes/states/theme_state.dart';
import 'package:flutter_mappable_test/themes/theme_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final themeState = ThemeState(
    themePath: {},
    selectedOption: CustomThemeOption.system,
  );

  runApp(
    ProviderScope(
      overrides: [
        // themeStateNotifierProvider.overrideWith((ref) {
        //   final notifier = ThemeStateNotifier(themeState);
        //   notifier.initialize().then((t) => {});
        //   return notifier;
        // }),
      ],
      child: MyApp(),
    ),
  );
}

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});
//   //   ///追加の初期化処理があればここに記述
//   //   @override
//   //   void initState() {
//   //     super.initState();
//   //     _initializationFuture = ref
//   //         .read(themeStateNotifierProvider.notifier)
//   //         .initialize();
//   //   }
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final provider = ref.listen(themeStateNotifierProvider.notifier, (
//       previous,
//       next,
//     ) {
//       // テーマが変更されたときに再ビルドをトリガーするために空の関数を使用
//       // ここで何か特別な処理を行いたい場合は追加できます
//       final a = 1;
//     });
//     final themeModel = ref.watch(themeStateNotifierProvider);
//     return MaterialApp(
//       title: 'Flutter Demo',
//       themeMode: ThemeMode.system,
//       darkTheme: themeModel.currentTheme.dark,
//       theme: themeModel.currentTheme.light,
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//     ;
//   }
// }

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Future<bool>? _initializationFuture;

  ///追加の初期化処理があればここに記述
  @override
  void initState() {
    super.initState();
    _initializationFuture = ref
        .read(themeStateNotifierProvider.notifier)
        .initialize();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(themeStateNotifierProvider.notifier);
    final themeModel = ref.watch(themeStateNotifierProvider);
    return FutureBuilder(
      future: _initializationFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        } else {
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: ThemeMode.system,
            darkTheme: themeModel.currentTheme.dark,
            theme: themeModel.currentTheme.light,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        }
      },
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
  String message = '';
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(themeStateNotifierProvider.notifier);
    final model = ref.watch(themeStateNotifierProvider);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            RadioGroup(
              groupValue: model.selectedOption,
              onChanged: (v) => notifier.applyTheme(v!),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    value: CustomThemeOption.system,
                    title: const Text('System'),
                    subtitle: const Text('Follow system theme'),
                  ),
                  RadioListTile(
                    value: CustomThemeOption.pink,
                    title: const Text('Pink'),
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
              ),
            ),
            Text(
              '${model.selectedOption}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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
