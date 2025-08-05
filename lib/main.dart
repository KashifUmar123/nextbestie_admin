// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:nextbestie_admin/admin_app.dart';
import 'package:nextbestie_admin/core/base/local_dependencies.dart';

void main() async {
  // Configure URL strategy for web - must be called before any other initialization
  usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();
  await LocalDependencies.init();

  runApp(const AdminApp());
}
