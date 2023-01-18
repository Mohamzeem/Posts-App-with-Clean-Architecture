import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts/core/widgets/custom_loading_widget.dart';
import 'package:posts/core/widgets/custom_text_widget.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/features/posts/presentation/blocs/add_del_upd_bloc/add_del_upd_bloc.dart';
import 'package:posts/features/posts/presentation/pages/posts_page.dart';
import 'package:posts/features/posts/presentation/widgets/add_update_widgets/form_widget.dart';
import 'package:posts/utiles/show_snack_bar.dart';
import '../../../../core/consts/app_colors.dart';

class AddUpdatePostsPage extends StatelessWidget {
  final Post? post;
  final bool isUpdate;
  const AddUpdatePostsPage({super.key, this.post, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: BlocConsumer<AddDelUpdBloc, AddDelUpdState>(
          listener: (context, state) {
            if (state is AddDelUpdSuccessState) {
              ShowSnackBar().showSuccessSnackBar(
                  context: context, message: state.successMessage);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: ((context) => const PostsPage())),
                  (route) => false);
            } else if (state is AddDelUpdFailureState) {
              ShowSnackBar().showErrorSnackBar(
                  context: context, message: state.failureMessage);
            }
          },
          builder: (context, state) {
            if (state is AddDelUpdLoadingState) {
              return const LoadingWidget();
            } else {
              return FormWidget(
                  isupdate: isUpdate, post: isUpdate ? post : null);
            }
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: CustomTextWidget(
          text: isUpdate ? 'Edit Post' : 'Add Post',
          color: AppColors.kWhite,
          fontSize: 25,
          fontWeight: FontWeight.w600),
    );
  }
}
