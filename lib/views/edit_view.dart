import 'package:apps/models/note_model.dart';
import 'package:apps/widgets/custom_text_field.dart';
import 'package:apps/widgets/notes_view_app_bar.dart';
import 'package:flutter/material.dart';

class EditView extends StatelessWidget {
  const EditView({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        child: Column(
          children: [
            NotesViewAppBar(
                title: "Edit Note",
                icon: Icons.check,
                onTap: () {
                  Navigator.of(context).pop();
                }),
            const SizedBox(height: 32),
            CustomTextField(hintText: note.title),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: note.subTitle,
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
