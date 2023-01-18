// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:posts/core/consts/app_colors.dart';
import 'package:posts/core/widgets/custom_text_widget.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/features/posts/presentation/pages/post_details_page.dart';

class PostsListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostsListWidget({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      separatorBuilder: (context, index) {
        return const Divider(thickness: 1, color: AppColors.kPrimary);
      },
      itemBuilder: (context, index) {
        return ListTile(
          leading: CustomTextWidget(
              text: posts[index].id.toString(),
              color: AppColors.kPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w500),
          title: CustomTextWidget(
              text: posts[index].title,
              color: AppColors.kPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w500),
          subtitle: CustomTextWidget(
              text: posts[index].body,
              color: AppColors.kGray,
              fontSize: 17,
              fontWeight: FontWeight.w300),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => PostDetailsPage(post: posts[index])),
              ),
            );
          },
        );
      },
    );
  }
}
