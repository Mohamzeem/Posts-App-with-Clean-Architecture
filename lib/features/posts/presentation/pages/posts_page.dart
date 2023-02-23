import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts/core/consts/app_colors.dart';
import 'package:posts/features/posts/presentation/blocs/posts_bloc/posts_bloc.dart';
import 'package:posts/features/posts/presentation/pages/add_update_posts_page.dart';
import 'package:posts/features/posts/presentation/widgets/posts_widgets/posts_list.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../widgets/posts_widgets/error_message.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(),
      floatingActionButton: _floatingActionButton(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.w),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: ((context, state) {
            if (state is PostsSuccessState) {
              return RefreshIndicator(
                  onRefresh: () => _refreshMethod(context),
                  child: PostsListWidget(posts: state.post));
            } else if (state is PostsLoadingState) {
              return const LoadingWidget();
            } else if (state is PostsFailureState) {
              return ErrorMessageWidget(
                message: state.message,
              );
            }
            return const LoadingWidget();
          }),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const CustomTextWidget(
          text: 'Posts',
          color: AppColors.kWhite,
          fontSize: 25,
          fontWeight: FontWeight.w600),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) =>
                    const AddUpdatePostsPage(isUpdate: false))));
      },
      child: Icon(
        Icons.add,
        color: AppColors.kWhite,
        size: 30.r,
      ),
    );
  }

  Future<void> _refreshMethod(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }
}
