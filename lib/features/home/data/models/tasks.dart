class Tasks {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  Tasks({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Tasks.fromJson(Map<String, dynamic> json) => Tasks(
        id: json['id'],
        todo: json['todo'],
        completed: json['completed'],
        userId: json['userId'],
      );
}

class TaskList {
  final List<Tasks> todos;
  final int total;
  final int skip;
  final int limit;

  TaskList({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory TaskList.fromJson(Map<String, dynamic> json) => TaskList(
        todos: (json['todos'] as List)
            .map((todoJson) => Tasks.fromJson(todoJson))
            .toList(),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );
}
