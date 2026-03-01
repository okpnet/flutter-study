import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_win_webview_go_router/pages/application_scope/dashboard/root/dashboard_router.dart';

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
          const DashboardRouter().go(context);
        }
      });
      return null;
    }, []);
    return Scaffold(body: SizedBox.shrink());
  }
}
