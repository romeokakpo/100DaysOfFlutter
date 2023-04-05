import 'package:day7/app/models/onboard_model.dart';
import 'package:day7/app/services/assets_services.dart';

final List<OnboardModel> onboardData = [
  OnboardModel(AssetsServices.onBoard1, "Create Your Task",
      "Create your task to get an overview"),
  OnboardModel(AssetsServices.onBoard2, "Manage your Daily Task",
      "Manage your tasks with this application"),
  OnboardModel(AssetsServices.onBoard3, "List Finished Task",
      "View completed tasks to see your progress"),
];

final List<Map<String, dynamic>> widgetsList = [
  {"title": "Task List"},
  {"title": "Task Done"},
  {"title": "Archived task"},
];
