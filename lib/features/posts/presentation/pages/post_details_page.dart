// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts/core/consts/app_colors.dart';
import 'package:posts/core/widgets/custom_loading_widget.dart';
import 'package:posts/core/widgets/custom_text_widget.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/features/posts/presentation/blocs/add_del_upd_bloc/add_del_upd_bloc.dart';
import 'package:posts/features/posts/presentation/pages/add_update_posts_page.dart';
import 'package:posts/features/posts/presentation/pages/posts_page.dart';
import 'package:posts/utiles/show_snack_bar.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;
  const PostDetailsPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextWidget(
                  text: post.title,
                  color: AppColors.kPrimary,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
              const Divider(
                  height: 50, thickness: 1, color: AppColors.kPrimary),
              CustomTextWidget(
                  text: post.body,
                  color: AppColors.kGray,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              const Divider(
                  height: 50, thickness: 1, color: AppColors.kPrimary),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 115.h,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => AddUpdatePostsPage(
                                  isUpdate: true, post: post)),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit),
                        label: const CustomTextWidget(
                            text: 'EDIT',
                            color: AppColors.kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    width: 115.h,
                    child: ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: ((context) {
                                return BlocConsumer<AddDelUpdBloc,
                                        AddDelUpdState>(
                                    listener: ((context, state) {
                                  if (state is AddDelUpdSuccessState) {
                                    ShowSnackBar().showSuccessSnackBar(
                                        context: context,
                                        message: state.successMessage);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const PostsPage(),
                                        ),
                                        (route) => false);
                                  } else if (state is AddDelUpdFailureState) {
                                    ShowSnackBar().showErrorSnackBar(
                                        context: context,
                                        message: state.failureMessage);
                                  }
                                }), builder: ((context, state) {
                                  if (state is AddDelUpdLoadingState) {
                                    return const LoadingWidget();
                                  }
                                  return AlertDialog(
                                    title: const CustomTextWidget(
                                        text: 'Are You Sure?',
                                        color: AppColors.kPrimary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              BlocProvider.of<AddDelUpdBloc>(
                                                      context)
                                                  .add(DeletePostEvent(
                                                      postId: post.id!)),
                                          child: const Text('Yes')),
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('No')),
                                    ],
                                  );
                                }));
                              }));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kRed),
                        icon: const Icon(Icons.delete),
                        label: const CustomTextWidget(
                            text: 'DELETE',
                            color: AppColors.kWhite,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
