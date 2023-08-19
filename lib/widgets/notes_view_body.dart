import 'package:apps/cubits/notes_cubit/notes_cubit.dart';
import 'package:apps/models/note_model.dart';
import 'package:apps/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;

      return ListView.separated(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => NoteItem(note: notes[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: notes.length);
    });
  }
}
