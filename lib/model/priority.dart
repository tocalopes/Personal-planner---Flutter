class PriorityModel{

  static final String tableName = "priority";
  static final String idColumn = "id_priority";
  static final String levelColumn = "level";
  static final String nameColumn = "name";

  static final int low = 1;
  static final int meddium = 2;
  static final int mandatory = 3;

  static final String createScript = 
    "CREATE TABLE $tableName(,"
      "$idColumn INTEGER PRIMARY KEY,"
      "$levelColumn int,"
      "$nameColumn text;"
      "INSERT INTO $tableName VALUES (1,1,'low');"
      "INSERT INTO $tableName VALUES (2,2,'meddium');"
      "INSERT INTO $tableName VALUES (3,4,'mandatory');";

  
}