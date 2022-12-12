import 'dart:developer';

import 'package:ex_03/todos_api.dart';

import 'package:http/http.dart' as http;

void main(List<String> args) {
  http.Client client = http.Client();

  final api = TodosApi(client: client);
  api.getById(1).then((value) => print(value.title));
}
