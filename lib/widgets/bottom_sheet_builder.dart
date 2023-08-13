import 'package:apps/widgets/custom_btn.dart';
import 'package:apps/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class BottomSheetBuilder extends StatelessWidget {
  const BottomSheetBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          // key: _,
          child: Container(
        height: 400,
        child: ListView(
          children: [
            const SizedBox(height: 16),
            const CustomTextField(hintText: "Note Title"),
            const SizedBox(height: 16),
            const CustomTextField(hintText: "Note Description", maxLines: 7),
            const SizedBox(height: 32),
            CustomBtn(onPressed: () {})
          ],
        ),
      )),
    );
  }
}
