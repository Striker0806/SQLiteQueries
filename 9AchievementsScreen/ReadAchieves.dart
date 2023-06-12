Future<List<Map<String, dynamic>>> getAllTaskAchievements() async {
  final db = await initializeDB();

  final List<Map<String, dynamic>> maps = await db.query(
    'Tasks',
    columns: ['AchievementBadge', 'AchievementDescription'],
  );

  return maps;
}
