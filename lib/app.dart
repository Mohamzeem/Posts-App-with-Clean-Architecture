import 'package:flutter/material.dart';
import 'package:posts/features/posts/presentation/pages/posts_page.dart';

import 'core/themes/app_theme.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: AppStrings.appName,
      theme: appTheme(),
      home: const PostsScreen(),
      // onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
