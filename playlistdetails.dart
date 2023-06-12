Future<List<Map<String, dynamic>>> getPlaylistMedia(int playlistID) async {
  final db = await initializeDB();

  final List<Map<String, dynamic>> maps = await db.query(
    'PlaylistItems',
    where: "PlaylistID = ?",
    whereArgs: [playlistID],
  );

  return maps;
}
