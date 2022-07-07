import 'package:flutter/material.dart';
import 'package:tuso_working_with_rest_api/models/note_for_listing.dart';
import 'package:tuso_working_with_rest_api/views/note_modify.dart';

class NoteList extends StatelessWidget {
  //const NoteList({Key? key}) : super(key: key);

  final notes = [
    new NoteForListing(
        noteID: "1",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 1"),
    new NoteForListing(
        noteID: "2",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 2"),
    new NoteForListing(
        noteID: "3",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 3")
  ];

  String formatDatetime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => Divider(height: 1, color: Colors.green),
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(notes[index].noteTitle!,
                style: TextStyle(color: Theme.of(context).primaryColor)),
            subtitle: Text(
                'Last edited on ${formatDatetime(notes[index].latestEditDateTime!)}'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => NoteModify()));
            },
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
