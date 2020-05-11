class TaskModel{

  static final String tableName = "tasks";
  static final String idColumn = "id_task";
  static final String nameColumn = "name";
  static final String descriptionColumn = "description";
  static final String hrBeginColumn = "hr_begin";
  static final String hrEndColumn = "hr_end";
  static final String doneColumn = "done";
  static final String creationDateColumn = "creation_date";
  static final String idPriorityColumn = "id_priority";
  static final String priorityTableReference = "priority";
  static final String createScript = 
    "CREATE TABLE $tableName("
      "$idColumn INTEGER PRIMARY KEY,"
      "$nameColumn TEXT NOT NULL,"
      "$descriptionColumn TEXT,"
      "$hrBeginColumn TEXT,"
      "$hrEndColumn TEXT,"
      "$doneColumn TINYINT,"
      "$creationDateColumn TEXT NOT NULL,"
      "$idPriorityColumn INT NOT NULL,"
      "FOREIGN KEY ($idPriorityColumn) REFERENCES $priorityTableReference($idPriorityColumn)"
    ")";    

  int id;
  String name;
  String description;
  int hrBegin;
  int hrEnd;
  DateTime creationDate;
  bool done;
  int idPriority;
  
  TaskModel.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    description = map[descriptionColumn];
    hrBegin = timeToInteger(map[hrBeginColumn]);
    hrEnd = timeToInteger(map[hrFinalColumn]);
    creationDate = DateTime.parse(map[creationDateColumn]);
    done = (int.parse(map[doneColumn]) == 1) ? true : false;
    idPriority = map[idPriorityColumn];
  }

  Map<String,dynamic> toMap(){
    Map map = {
      nameColumn : name,
      descriptionColumn : description,
      hrBeginColumn : timeToString(hrBegin),
      hrEndColumn : timeToString(hrEnd),
      creationDateColumn : creationDate.toString(),
      doneColumn : (done) ? 1 : 0,
      idPriorityColumn : idPriority,
    };
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }



  String timeToString(int time){
    String h = (time ~/ 60).toString();
    String m = (time % 60).toString();
    if (h.length < 2){
      h = "0" + h;
    }
    if(m.length < 2){
      m = "0" + m;
    }
    return (h+":"+m);
  }

  int timeToInteger(String time){
    var aux = time.split(":");
    int h = int.parse(aux[0]) * 60;
    int m = int.parse(aux[1]);

    return h + m;

  }

  
  

}