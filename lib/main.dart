import 'package:flutter/material.dart';
import 'package:posts/app.dart';
import 'dependency_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const PostsApp());
}
