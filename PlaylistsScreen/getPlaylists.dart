Future<List<Map<String, dynamic>>> getPlaylists() async {
  final db = await initializeDB();

  final List<Map<String, dynamic>> maps = await db.query('Playlists');

  return maps;
}
