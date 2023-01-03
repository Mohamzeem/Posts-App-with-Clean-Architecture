import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          title: const Text('Posts'),
        ),
        body: Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
