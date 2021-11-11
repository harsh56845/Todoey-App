class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  late DateTime createdTime;
  late String title;
  late String id;
  late String description;
  late bool isDone;

  Todo(
      {required this.createdTime,
      this.description= '',
      required this.id,
      this.isDone=false,
      required this.title});
}
