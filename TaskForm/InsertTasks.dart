
class SubTask {
  int? subtaskID;
  int? taskID;
  String name;
  String? description;
  String completionStatus;
  int repeat;
  int? repeatEvery;
  String? everyUnit;
  String? startDate;
  String? endDate;
  String? notes;
  String? achievementBadge;
  String? achievementDescription;

  SubTask({
    this.subtaskID,
    this.taskID,
    required this.name,
    this.description,
    this.completionStatus = 'Not Completed',
    this.repeat = 0,
    this.repeatEvery,
    this.everyUnit,
    this.startDate,
    this.endDate,
    this.notes,
    this.achievementBadge,
    this.achievementDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'SubtaskID': subtaskID,
      'TaskID': taskID,
      'Name': name,
      'Description': description,
      'CompletionStatus': completionStatus,
      'Repeat': repeat,
      'RepeatEvery': repeatEvery,
      'EveryUnit': everyUnit,
      'StartDate': startDate,
      'EndDate': endDate,
      'Notes': notes,
      'AchievementBadge': achievementBadge,
      'AchievementDescription': achievementDescription,
    };
  }
}

class SubtaskItem {
  int? subtaskID;
  String itemName;
  int itemStatus;

  SubtaskItem({
    this.subtaskID,
    required this.itemName,
    this.itemStatus = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'SubtaskID': subtaskID,
      'ItemName': itemName,
      'ItemStatus': itemStatus,
    };
  }
}


Future<void> insertSubTask(SubTask subTask) async {
  final db = await initializeDB();

  await db.insert(
    'SubTasks',
    subTask.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> insertSubTaskItem(SubtaskItem subtaskItem) async {
  final db = await initializeDB();

  await db.insert(
    'SubtaskItems',
    subtaskItem.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
