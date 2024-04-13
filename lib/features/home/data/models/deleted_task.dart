// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class DeletedTask {
  int? id;
  String? todo;
  bool? completed;
  int? userId;
  bool? isDeleted;
  DateTime? deletedOn;

  DeletedTask({
    this.id,
    this.todo,
    this.completed,
    this.userId,
    this.isDeleted,
    this.deletedOn,
  });

  factory DeletedTask.fromJson(Map<String, dynamic> json) => DeletedTask(
        id: json['id'] as int?,
        todo: json['todo'] as String?,
        completed: json['completed'] as bool?,
        userId: json['userId'] as int?,
        isDeleted: json['isDeleted'] as bool?,
        deletedOn: json['deletedOn'] == null
            ? null
            : DateTime.parse(json['deletedOn'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'todo': todo,
        'completed': completed,
        'userId': userId,
        'isDeleted': isDeleted,
        'deletedOn': deletedOn?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DeletedTask) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      todo.hashCode ^
      completed.hashCode ^
      userId.hashCode ^
      isDeleted.hashCode ^
      deletedOn.hashCode;
}
