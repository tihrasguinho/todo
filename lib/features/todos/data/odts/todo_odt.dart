import 'package:todo/features/todos/domain/entities/todo_entity.dart';

class TodoOdt extends TodoEntity {
  final String todoId;
  final String todoOwner;
  final String todoTitle;
  final String todoSubtitle;
  final bool todoDone;

  TodoOdt({
    required this.todoId,
    required this.todoOwner,
    required this.todoTitle,
    required this.todoSubtitle,
    required this.todoDone,
  }) : super(
          id: todoId,
          owner: todoOwner,
          title: todoTitle,
          subtitle: todoSubtitle,
          done: todoDone,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': todoId,
      'owner': todoOwner,
      'title': todoTitle,
      'subtitle': todoSubtitle,
      'done': todoDone,
    };
  }

  factory TodoOdt.fromMap(Map<String, dynamic> map) {
    return TodoOdt(
      todoId: map['id'] ?? '',
      todoOwner: map['owner'] ?? '',
      todoTitle: map['title'] ?? '',
      todoSubtitle: map['subtitle'] ?? '',
      todoDone: map['done'] ?? false,
    );
  }
}
