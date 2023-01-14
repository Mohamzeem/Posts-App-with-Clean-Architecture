import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/posts/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:posts/features/posts/presentation/pages/posts_page.dart';
import 'core/themes/app_theme.dart';
import 'dependency_injection.dart' as di;
import 'features/posts/presentation/blocs/add_del_upd_bloc/add_del_upd_bloc.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: Colors.pink,
    //     statusBarBrightness: Brightness.dark,
    //     statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<PostsBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<AddDelUpdBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: AppStrings.appName,
        theme: appTheme(),
        home: const PostsScreen(),
        // onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
