import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


Future<Database> initializeDB() async {
  final directory = await getApplicationDocumentsDirectory();
  final path = join(directory.path, 'task_management.db');
  
  return openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE Tasks ("
        "TaskID INTEGER PRIMARY KEY,"
        "Name TEXT NOT NULL,"
        "Description TEXT,"
        "CompletionStatus TEXT CHECK(CompletionStatus IN ('Completed', "Routines", "Stopped", "OnGoing", "Scheduled",'Not Completed')) DEFAULT 'Not Completed',"
        "StartDate TEXT,"
        "CompletionDate TEXT,"
        "AchievementBadge TEXT,"
        "AchievementDescription TEXT)"
      );
      
      await db.execute(
        "CREATE TABLE SubTasks ("
        "SubtaskID INTEGER PRIMARY KEY,"
        "TaskID INTEGER,"
        "Name TEXT NOT NULL,"
        "Description TEXT,"
        "CompletionStatus TEXT CHECK(CompletionStatus IN ('Completed', 'Not Completed')) DEFAULT 'Not Completed',"
        "Repeat INTEGER CHECK(Repeat IN (0, 1)) DEFAULT 0,"
        "RepeatEvery INTEGER,"
        "EveryUnit TEXT,"
        "StartDate TEXT,"
        "EndDate TEXT,"
        "Notes TEXT,"
        "AchievementBadge TEXT,"
        "AchievementDescription TEXT,"
        "FOREIGN KEY (TaskID) REFERENCES Tasks (TaskID))"
      );
      
      await db.execute(
        "CREATE TABLE Playlists ("
        "PlaylistID INTEGER PRIMARY KEY,"
        "PlaylistName TEXT NOT NULL,"
        "PlaylistDescription TEXT)"
      );

      await db.execute(
        "CREATE TABLE PlaylistItems ("
        "PlaylistID INTEGER,"
        "MediaName TEXT NOT NULL,"
        "MediaDescription TEXT,"
        "MediaType TEXT,"
        "MediaPath TEXT,"
        "FOREIGN KEY (PlaylistID) REFERENCES Playlists (PlaylistID))"
      );

      await db.execute(
        "CREATE TABLE TaskPlaylists ("
        "TaskID INTEGER,"
        "PlaylistID INTEGER,"
        "FOREIGN KEY (TaskID) REFERENCES Tasks (TaskID),"
        "FOREIGN KEY (PlaylistID) REFERENCES Playlists (PlaylistID))"
      );

      await db.execute(
        "CREATE TABLE SubtaskPlaylists ("
        "SubtaskID INTEGER,"
        "PlaylistID INTEGER,"
        "FOREIGN KEY (SubtaskID) REFERENCES SubTasks (SubtaskID),"
        "FOREIGN KEY (PlaylistID) REFERENCES Playlists (PlaylistID))"
      );

      await db.execute(
        "CREATE TABLE SubtaskItems ("
        "SubtaskID INTEGER,"
        "ItemName TEXT NOT NULL,"
        "ItemStatus INTEGER CHECK(ItemStatus IN (0, 1)) DEFAULT 0,"
        "FOREIGN KEY (SubtaskID) REFERENCES SubTasks (SubtaskID))"
      );

      await db.execute(
        "CREATE TABLE TaskAchievementPlaylists ("
        "TaskID INTEGER,"
        "PlaylistID INTEGER,"
        "FOREIGN KEY (TaskID) REFERENCES Tasks (TaskID),"
        "FOREIGN KEY (PlaylistID) REFERENCES Playlists (PlaylistID))"
      );

       await db.execute(
        "CREATE TABLE SubtaskAchievementPlaylists ("
        "SubtaskID INTEGER,"
        "PlaylistID INTEGER,"
        "FOREIGN KEY (SubtaskID) REFERENCES SubTasks (SubtaskID),"
        "FOREIGN KEY (PlaylistID) REFERENCES Playlists (PlaylistID))"
      );
    },
  );
}

