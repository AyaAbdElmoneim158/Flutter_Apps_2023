import 'package:apps/models/note_model.dart';
import 'package:apps/util/constants.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  void addNote(NoteModel noteModel) {
    emit(AddNotesLoading());
    Hive.box<NoteModel>(notesBoxName).add(noteModel).then((value) {
      debugPrint("AddNotesSuccess..... $value");
      emit(AddNotesSuccess());
    }).catchError((err) {
      debugPrint("AddNotesFailure....");
      emit(AddNotesFailure(err: err.toString()));
    });
  }
}
