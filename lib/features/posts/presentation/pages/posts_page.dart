import 'package:flutter/material.dart';
import 'package:posts/core/consts/app_colors.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Posts',
          style: TextStyle(
              color: AppColors.kPrimary,
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}
