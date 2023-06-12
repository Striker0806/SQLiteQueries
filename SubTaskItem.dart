//
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
