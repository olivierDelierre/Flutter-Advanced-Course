import 'package:ex_03/todo.dart';
import 'package:ex_03/todos_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'todos_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  final client = MockClient();
  late TodosApi api;

  setUp(() => api = TodosApi(client: client));

  test('`getById` throws an error if ID is lower than zero', () {
    expect(() => api.getById(-1), throwsA(isA<Error>()));
  });

  test('`getById` throws an error if HTTP code is not 200', () {
    int id = 10;

    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?id=$id'))).thenAnswer(
      (_) async => http.Response(
        '',
        500,
      ),
    );

    expect(() => api.getById(id), throwsA(isA<Error>()));
  });

  test('`getById` throws an error if ID does not exist', () {
    int id = 999999;

    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?id=$id'))).thenAnswer(
      (_) async => http.Response(
        '[]',
        200,
      ),
    );

    expect(() => api.getById(id), throwsA(isA<Error>()));
  });

  test('`getById` returns the Todo linked to the ID sent.', () async {
    int id = 1;

    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/todos?id=$id'))).thenAnswer(
      (_) async => http.Response(
        '[{"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false}]',
        200,
      ),
    );

    final Todo actual = await api.getById(id);
    expect(actual.userId, 1);
    expect(actual.id, 1);
    expect(actual.title, 'delectus aut autem');
    expect(actual.completed, false);
  });
}
