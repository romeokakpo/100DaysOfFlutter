import 'package:day7/app/models/task_model.dart';

class ListModel {
  final int? id;
  final String title;
  final String date;
  final int color;
  final String status;
  final List<TaskModel> tasks;

  ListModel(
      this.id, this.title, this.date, this.color, this.status, this.tasks);

  factory ListModel.fromMap(Map<String, dynamic> map) {
    return ListModel(map['list_id'], map['title'], map['l_date'], map['color'],
        map['status'], map['tasks']);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list_id': id,
      'title': title,
      'l_date': date,
      'color': color,
      'status': status
    };
  }
}
