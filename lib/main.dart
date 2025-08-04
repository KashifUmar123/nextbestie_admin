// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:nextbestie_admin/admin_app.dart';
import 'package:nextbestie_admin/core/base/local_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDependencies.init();
  usePathUrlStrategy();

  runApp(const AdminApp());
}
