import 'package:flutter/material.dart';
import 'package:flutter_go_router/pages/settings/setting_page.dart';
import 'package:go_router/go_router.dart';

part 'setting_router.g.dart';

const String settingPath = '/setting';
const String settingName = 'setting';

@TypedGoRoute<SettingRouter>(path: settingPath, name: settingName)
class SettingRouter extends GoRouteData with $SettingRouter {
  const SettingRouter();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SettingPage();
  }
}
