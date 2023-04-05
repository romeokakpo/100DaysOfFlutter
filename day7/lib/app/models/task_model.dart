class TaskModel {
  final int id;
  final String title;
  final String status;

  TaskModel(this.id, this.title, this.status);

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(map['task_id'], map['title'], map['status']);
  }
}
