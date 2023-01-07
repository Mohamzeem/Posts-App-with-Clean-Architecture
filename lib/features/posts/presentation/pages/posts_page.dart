import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:posts/core/consts/app_colors.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     'Posts',
      //     style: TextStyle(
      //         color: AppColors.kPrimary,
      //         fontSize: 25,
      //         fontWeight: FontWeight.w600),
      //   ),
      //   backgroundColor: Colors.amber,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // Expanded(
            //   child: Image.asset(
            //     'assets/Camera Image.png',
            //     fit: BoxFit.fill,
            //     width: double.infinity,
            //     height: double.infinity,
            //   ),
            // )
            Text(
              'Posts',
              style: TextStyle(
                  color: AppColors.kBlack,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
