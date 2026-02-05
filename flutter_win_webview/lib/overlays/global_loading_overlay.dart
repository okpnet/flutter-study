import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_win_webview/overlays/loading_screen.dart';

class GlobalLoadingOverlay extends ConsumerWidget {
  final Widget child;

  const GlobalLoadingOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(loadingScreenStateProvider);
    return Stack(
      children: [
        child,
        if (isLoading)
          Container(
            decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CupertinoActivityIndicator(radius: 60)],
            ),
          ),
      ],
    );
  }
}
