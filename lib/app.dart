import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posts/features/posts/presentation/pages/posts_page.dart';
import 'core/themes/app_theme.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.pink,
    //     statusBarBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: AppStrings.appName,
      theme: appTheme(),
      home: const PostsScreen(),
      // onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
