import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/app/navigation/homes/home_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ErrorPage extends HookWidget {
  final Exception? exception;
  const ErrorPage({this.exception, super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final isBackHome = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('ERROR'),
              content: Text(exception?.toString() ?? ''),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        if (isBackHome != null && isBackHome && context.mounted) {
          const HomeRouter().go(context);
        }
      });
      return null;
    }, []);
    return Scaffold(body: SizedBox.shrink());
  }
}
