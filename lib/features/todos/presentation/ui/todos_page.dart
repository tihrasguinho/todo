import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/features/todos/data/odts/todo_odt.dart';
import 'package:todo/features/todos/domain/entities/todo_entity.dart';
import 'package:todo/features/todos/presentation/states/todo_state.dart';
import 'package:todo/features/todos/presentation/stores/todos_store.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final TodosStore todos = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => todos.add(
          TodoEntity(
            id: '',
            owner: '',
            title: 'Estudar Flutter',
            subtitle: 'Agora',
          ),
        ),
        label: const Text('Add'),
      ),
      body: ValueListenableBuilder<TodoState>(
        valueListenable: todos,
        builder: (context, state, child) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is Error) {
            return Center(child: Text(state.error));
          }

          if (state is Success) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final item = state.todos[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Material(
                    color: item.done ? Colors.green.shade400 : Colors.red.shade400,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () => todos.makeDone(item),
                      borderRadius: BorderRadius.circular(8),
                      splashColor: Colors.black12,
                      highlightColor: Colors.black12,
                      child: ListTile(
                        title: Text(
                          item.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          item.subtitle,
                          style: const TextStyle(color: Colors.white60),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
