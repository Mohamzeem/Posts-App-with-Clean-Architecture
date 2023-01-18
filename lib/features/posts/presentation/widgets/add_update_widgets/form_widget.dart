import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:posts/core/widgets/custom_elevated_button.dart';
import 'package:posts/features/posts/domain/entities/post.dart';
import 'package:posts/features/posts/presentation/blocs/add_del_upd_bloc/add_del_upd_bloc.dart';
import '../../../../../core/widgets/custom_text_from_field.dart';

class FormWidget extends StatefulWidget {
  final Post? post;
  final bool isupdate;
  const FormWidget({
    Key? key,
    this.post,
    required this.isupdate,
  }) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isupdate) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                height: 70,
                width: double.infinity,
                controller: titleController,
                maxLines: 1,
                hintText: 'Title',
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomTextFormField(
                height: 240,
                width: double.infinity,
                controller: bodyController,
                maxLines: 10,
                hintText: 'Content',
              ),
              CustomElevatedBtnWidget(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    // formkey.currentState!.save();
                    final post = Post(
                        id: widget.isupdate ? widget.post!.id : null,
                        title: titleController.text,
                        body: bodyController.text);
                    if (widget.isupdate) {
                      BlocProvider.of<AddDelUpdBloc>(context)
                          .add(UpdatePostEvent(post: post));
                    } else {
                      BlocProvider.of<AddDelUpdBloc>(context)
                          .add(AddPostEvent(post: post));
                    }
                  }
                },
                isupdate: widget.isupdate,
              )
            ],
          ),
        ),
      ),
    );
  }
}
