import 'package:flutter_test/flutter_test.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';

void main() {
  TodoEntity todo = TodoEntity(id: 'id', owner: 'owner', title: 'title', subtitle: 'subtitle');

  test('Should not be null', () {
    expect(todo, isNotNull);
  });

  test('TITLE: Should not be empty', () {
    expect(todo.title, isNotEmpty);
  });

  test('SUBTITLE: Should not be empty', () {
    expect(todo.subtitle, isNotEmpty);
  });

  test('DONE: Should be false', () {
    expect(todo.done, equals(false));
  });
}
