import 'dart:convert';

//import 'package:flutter/material.dart';
import 'package:tuso_working_with_rest_api/models/api_response.dart';
import 'package:tuso_working_with_rest_api/models/note.dart';
import 'package:tuso_working_with_rest_api/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {'apiKey': '04ad70cc-0822-4663-9e34-81007343505e'};

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get(Uri.parse(API + '/notes'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForListing>[];
        for (var item in jsonData) {
          notes.add(NoteForListing.fromJson(item));
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }
      return APIResponse<List<NoteForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<NoteForListing>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<Note>> getNote(String noteID) {
    return http.get(Uri.parse(API + '/notes/' + noteID), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Note>(data: Note.fromJson(jsonData));
      }
      return APIResponse<Note>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<Note>(
        error: true, errorMessage: 'An error occured'));
  }
}