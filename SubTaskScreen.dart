Future<List<Map<String, dynamic>>> getSubTasksForTask(int taskID) async {
  final db = await initializeDB();

  final List<Map<String, dynamic>> maps = await db.query(
    'SubTasks',
    where: "TaskID = ?",
    whereArgs: [taskID],
  );

  return maps;
}



Future<List<Map<String, dynamic>>> getChecklistForSubtask(int subtaskID) async {
  final db = await initializeDB();

  final List<Map<String, dynamic>> maps = await db.query(
    'SubtaskItems',
    where: "SubtaskID = ?",
    whereArgs: [subtaskID],
  );

  return maps;
}
