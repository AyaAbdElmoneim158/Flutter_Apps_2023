import 'package:bloc/bloc.dart';
import 'package:apps/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:apps/util/constants.dart';
part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  void fetchNotes() {
    debugPrint("len: ${Hive.box<NoteModel>(notesBoxName).values.length}");
    var box = Hive.box<NoteModel>(notesBoxName);
    notes = box.values.toList();
    emit(NotesFetching());
  }
}
