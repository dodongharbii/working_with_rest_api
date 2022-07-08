import 'package:flutter/material.dart';
import 'package:tuso_working_with_rest_api/models/api_response.dart';
import 'package:tuso_working_with_rest_api/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  Future<APIResponse<List<NoteForListing>>> getNotesList() {}
}
