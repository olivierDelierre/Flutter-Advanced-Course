import 'dart:convert';

import 'package:ex_03/todo.dart';
import 'package:http/http.dart' as http;

class TodosApi {
  final http.Client client;

  TodosApi({required this.client});

  Future<Todo> getById(int id) async {
    if (id < 0) {
      // ID not valid at this stage.
      throw Error();
    }

    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?id=$id'));

    if (response.statusCode != 200) {
      // Network issue at this stage.
      throw Error();
    }

    final List<dynamic> rawResult = jsonDecode(response.body);
    if (rawResult.isEmpty) {
      // ID not found at this stage.
      throw Error();
    }

    return Todo.fromJson(rawResult.single);
  }
}
