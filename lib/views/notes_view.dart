import 'package:apps/widgets/bottom_sheet_builder.dart';
import 'package:apps/widgets/notes_view_app_bar.dart';
import 'package:apps/widgets/notes_view_body.dart';
import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 24),
            NotesViewAppBar(),
            SizedBox(height: 24),
            Expanded(child: NotesViewBody()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            enableDrag: false,
            elevation: 0,
            // backgroundColor: Colors.b,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )),
            builder: (context) => const BottomSheetBuilder(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
