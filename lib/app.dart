import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/features/posts/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:posts/features/posts/presentation/pages/posts_page.dart';
import 'core/themes/app_theme.dart';
import 'dependency_injection.dart' as di;
import 'features/posts/presentation/blocs/add_del_upd_bloc/add_del_upd_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostsApp extends StatelessWidget {
  const PostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
        BlocProvider(create: (_) => di.sl<AddDelUpdBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.72727272727275, 781.0909090909091),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) => MaterialApp(
              debugShowCheckedModeBanner: true,
              theme: appTheme(),
              home: const PostsPage(),
            )),
      ),
    );
  }
}
