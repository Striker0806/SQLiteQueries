Future<List<Map<String, dynamic>>> getSubtaskAchievementsForTask(int taskID) async {
  final db = await initializeDB();

  // First, get all subtasks for the task
  final List<Map<String, dynamic>> subtaskMaps = await db.query(
    'SubTasks',
    where: "TaskID = ?",
    whereArgs: [taskID],
  );

  // Next, for each subtask, fetch the achievements
  List<Map<String, dynamic>> achievements = [];
  for (var subtask in subtaskMaps) {
    int subtaskID = subtask['SubtaskID'];
    final List<Map<String, dynamic>> achievementMaps = await db.query(
      'SubTasks',
      columns: ['AchievementBadge', 'AchievementDescription'],
      where: "SubtaskID = ?",
      whereArgs: [subtaskID],
    );
    achievements.addAll(achievementMaps);
  }

  return achievements;
}
