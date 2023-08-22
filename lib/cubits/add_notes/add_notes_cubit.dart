import 'package:apps/models/note_model.dart';
import 'package:apps/util/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  Color colorNotes = const Color(0xff0E2954);

  void addNote(NoteModel noteModel) {
    noteModel.color = colorNotes.value;
    emit(AddNotesLoading());
    debugPrint(
        "len ${Hive.box<NoteModel>(notesBoxName).values.length.toString()}");
    Hive.box<NoteModel>(notesBoxName).add(noteModel).then((value) {
      debugPrint("AddNotesSuccess..... $value");
      emit(AddNotesSuccess());
    }).catchError((err) {
      debugPrint("AddNotesFailure....$err");
      emit(AddNotesFailure(err: err.toString()));
    });
  }
}
