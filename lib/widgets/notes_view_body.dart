import 'package:apps/widgets/note_item.dart';
import 'package:flutter/material.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const NoteItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: 28);
  }
}
