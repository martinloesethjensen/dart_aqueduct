import 'package:dart_server/dart_server.dart';

class WordsController extends ResourceController {

  final _words = [
    {"word" : "horse"},
    {"word" : "cow"},
    {"word" : "camel"},
    {"word" : "goat"},
  ];

  @Operation.get()
  Future<Response> getAllWords() async {
    if (_words == null) {
      return Response.notFound();
    } else if (_words.isEmpty) {
      return Response.noContent();
    }
    return Response.ok(_words);
  }

  @Operation.get('id')
  Future<Response> getWordByID(@Bind.path('id') int id) async {
    return Response.ok(_words[id]);
  }

  @Operation.post()
  Future<Response> addWord() async {
    return Response.ok(null);
  }

  @Operation.put('id')
  Future<Response> updateWord(@Bind.path('id') int id) async {
    return Response.ok(null);
  }

  @Operation.delete('id')
  Future<Response> deleteWord(@Bind.path('id') int id) async {
    _words.removeAt(id);
    return Response.ok(null);
  }
}