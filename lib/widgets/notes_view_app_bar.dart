import 'package:apps/util/style.dart';
import 'package:apps/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class NotesViewAppBar extends StatelessWidget {
  const NotesViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Notes", style: AppTextStyle.styleTitle(context)),
        const CustomIcon()
      ],
    );
  }
}
