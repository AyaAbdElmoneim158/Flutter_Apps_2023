import 'package:apps/util/style.dart';
import 'package:apps/widgets/custom_icon.dart';
import 'package:flutter/material.dart';

class NotesViewAppBar extends StatelessWidget {
  const NotesViewAppBar(
      {super.key, this.title = "Notes", this.icon = Icons.search, this.onTap});
  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.styleTitle(context)),
        GestureDetector(
            onTap: onTap,
            child: CustomIcon(
              icon: icon,
            ))
      ],
    );
  }
}
