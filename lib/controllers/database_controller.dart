import 'dart:developer';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/constants.dart';
import '../models/note.dart';

class DatabaseController extends GetxController with StateMixin<List<Note>> {
  /// ------------------------
  /// VARIABLES
  /// ------------------------

  Database? _dnevnikDatabase;
  final RxList<Note> _notes = <Note>[].obs;
  final RxList<Note> _chosenNotes = <Note>[].obs;

  /// ------------------------
  /// GETTERS
  /// ------------------------

  List<Note> get notes => _notes;
  List<Note> get chosenNotes => _chosenNotes;

  /// ------------------------
  /// SETTERS
  /// ------------------------

  set notes(List<Note> value) => _notes.addAll(value);
  set chosenNotes(List<Note> value) => _chosenNotes.addAll(value);

  /// ------------------------
  /// INIT
  /// ------------------------

  @override
  Future<void> onInit() async {
    super.onInit();

    /// Get / Create the database
    await dnevnikDatabase;

    /// Set proper state, depending on the notes
    await updateNotesState();
  }

  /// ------------------------
  /// METHODS
  /// ------------------------

  void toggleChosenNote(Note note) {
    final noteChosen = chosenNotes.contains(note);
    if (noteChosen) {
      chosenNotes.remove(note);
    } else {
      chosenNotes.add(note);
    }
  }

  Future<void> deleteChosenNotes() async {
    chosenNotes.map((note) => deleteNote(note: note)).toList();
    await updateNotesState();
    chosenNotes.clear();
  }

  /// Get instance of database.
  /// If there is no database instance, create it
  Future<Database> get dnevnikDatabase async {
    log('Get the database');
    _dnevnikDatabase ??= await initDatabase();
    return _dnevnikDatabase!;
  }

  /// Method that initializes database
  Future<Database> initDatabase() async {
    log('Initialize the database');
    final dir = await getApplicationDocumentsDirectory();
    final path = dir.path + Constants.database.databaseName;
    final database = await openDatabase(
      path,
      version: 1,
      onCreate: createDatabase,
    );
    return database;
  }

  /// Creates tables in the database
  Future<void> createDatabase(Database database, int version) async {
    log('Create the database');

    /// Notes
    await database.execute(
      '''
CREATE TABLE ${Constants.database.notesTable}(${Constants.database.notesColId} INTEGER PRIMARY KEY AUTOINCREMENT, ${Constants.database.notesColTitle} TEXT, ${Constants.database.notesColContent} TEXT, ${Constants.database.notesColColor} INTEGER, ${Constants.database.notesColDate} TEXT)
''',
    );

    log('Database created');
  }

  /// Deletes entire database
  Future<void> deleteEntireDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = dir.path + Constants.database.databaseName;
    await deleteDatabase(path);
    log('Database deleted');
  }

  /// Fetches Table data in Map format
  Future<List<Map<String, dynamic>>> getNotesMapList() async {
    final database = await dnevnikDatabase;
    final List<Map<String, dynamic>> result = await database.query(
      Constants.database.notesTable,
    );
    return result;
  }

  /// Converts the Map format into proper Note models
  Future<List<Note>> getNotesList() async {
    final notesMapList = await getNotesMapList();
    final notesList = <Note>[];
    notesMapList
        .map((noteMap) => notesList.add(Note.fromMap(noteMap)))
        .toList();
    return notesList;
  }

  /// Insert note in table
  Future<int> insertNote({required Note note}) async {
    final database = await dnevnikDatabase;
    final result = await database.insert(
      Constants.database.notesTable,
      note.toMap(),
    );
    await updateNotesState();
    return result;
  }

  /// Update note from table
  Future<int> updateNote({required Note note}) async {
    final database = await dnevnikDatabase;
    final result = await database.update(
      Constants.database.notesTable,
      note.toMap(),
      where: '${Constants.database.notesColId} = ?',
      whereArgs: [note.id],
    );
    await updateNotesState();
    return result;
  }

  /// Delete note from table
  Future<int> deleteNote({required Note note}) async {
    final database = await dnevnikDatabase;
    final result = await database.delete(
      Constants.database.notesTable,
      where: '${Constants.database.notesColId} = ?',
      whereArgs: [note.id],
    );
    return result;
  }

  Future<void> updateNotesState() async {
    notes.clear();
    notes = await getNotesList();
    if (notes.isEmpty) {
      change(notes, status: RxStatus.empty());
    }
    if (notes.isNotEmpty) {
      change(notes, status: RxStatus.success());
    }
  }
}
