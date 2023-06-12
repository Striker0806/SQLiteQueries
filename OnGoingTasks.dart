Future<List<Map<String, dynamic>>> getOngoingTasks() async {
  // get a reference to the database
  final db = await initializeDB();

  // query the 'Tasks' table for ongoing tasks
  final List<Map<String, dynamic>> maps = await db.query(
    'Tasks',
    where: "CompletionStatus = ?",
    whereArgs: ['OnGoing'],
  );

  return maps;
}

//Same for All four...
