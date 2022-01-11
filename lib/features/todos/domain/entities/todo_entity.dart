class TodoEntity {
  final String id;
  final String owner;
  final String title;
  final String subtitle;
  final bool done;

  TodoEntity({
    required this.id,
    required this.owner,
    required this.title,
    required this.subtitle,
    this.done = false,
  });

  bool get isDone => done;
}
