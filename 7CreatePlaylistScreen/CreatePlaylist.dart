class Playlist {
  int? playlistID;
  String playlistName;
  String? playlistDescription;

  Playlist({
    this.playlistID,
    required this.playlistName,
    this.playlistDescription,
  });

  Map<String, dynamic> toMap() {
    return {
      'PlaylistID': playlistID,
      'PlaylistName': playlistName,
      'PlaylistDescription': playlistDescription,
    };
  }
}


Future<void> insertPlaylist(Playlist playlist) async {
  final db = await initializeDB();

  await db.insert(
    'Playlists',
    playlist.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
