import 'package:flutter/material.dart';
import 'package:todo/features/todos/data/odts/todo_odt.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:todo/features/todos/domain/usecases/add_todo_usecase.dart';
import 'package:todo/features/todos/domain/usecases/get_todos_usecase.dart';
import 'package:todo/features/todos/domain/usecases/make_done_usecase.dart';
import 'package:todo/features/todos/presentation/states/todo_state.dart';

class TodosStore extends ValueNotifier<TodoState> {
  final GetTodosUsecase _getTodosUsecase;
  final AddTodoUsecase _addTodoUsecase;
  final MakeDoneUsecase _makeDoneUsecase;

  TodosStore(
    this._getTodosUsecase,
    this._addTodoUsecase,
    this._makeDoneUsecase,
  ) : super(Initial()) {
    fetch();
  }

  Future fetch() async {
    value = Loading();

    var result = await _getTodosUsecase();

    result.fold((l) {
      value = Error(l.toString());
    }, (r) {
      value = Success(r);
    });
  }

  clear() {
    value = Initial();
  }

  Future makeDone(TodoEntity todo) async {
    final doneTodo = TodoEntity(
      id: todo.id,
      owner: todo.owner,
      title: todo.title,
      subtitle: todo.subtitle,
      done: true,
    );

    var result = await _makeDoneUsecase(doneTodo);

    if (result.isRight()) {
      var data = (value as Success).todos;

      final index = data.indexWhere((e) => e.id == todo.id);

      final item = TodoOdt.fromMap({
        'id': data[index].id,
        'title': data[index].title,
        'subtitle': data[index].subtitle,
        'done': true,
        'owner': data[index].owner,
      });

      data.removeAt(index);

      data.insert(index, item);

      value = Success(data);
    } else {
      print(result.fold((l) => l, (r) => null).toString());
    }
  }

  Future add(TodoEntity todo) async {
    var result = await _addTodoUsecase(todo);

    if (result.isRight()) {
      late TodoEntity item;

      result.fold((l) => l, (r) => item = r);
      if (value is Success) {
        var todos = (value as Success).todos;

        value = Success([...todos, item]);
      } else {
        value = Success([item]);
      }
    } else {
      print(result);
    }
  }
}
