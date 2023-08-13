import 'package:apps/widgets/custom_btn.dart';
import 'package:apps/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class BottomSheetBuilder extends StatefulWidget {
  const BottomSheetBuilder({
    super.key,
  });

  @override
  State<BottomSheetBuilder> createState() => _BottomSheetBuilderState();
}

class _BottomSheetBuilderState extends State<BottomSheetBuilder> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SizedBox(
            height: 400,
            child: ListView(
              children: [
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: "Note Title", onSaved: (val) => title = val),
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: "Note Description",
                    maxLines: 7,
                    onSaved: (val) => description = val),
                const SizedBox(height: 32),
                CustomBtn(onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                })
              ],
            ),
          )),
    );
  }
}
