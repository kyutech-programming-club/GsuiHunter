class Quest {
  Quest(Map<String, Object> questData){
    this.name = questData['name'];
    this.time = questData['time'];
    this.diff = questData['diff'];
    this.pictureUrl  = questData['pictureUrl'];
  }
  String name;
  int time;
  int diff;
  String pictureUrl;
}
