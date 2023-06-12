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
