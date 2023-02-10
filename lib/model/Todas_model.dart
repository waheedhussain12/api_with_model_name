import 'dart:convert';
/// todos : [{"id":1,"todo":"Do something nice for someone I care about","completed":true,"userId":26},{"id":2,"todo":"Memorize the fifty states and their capitals","completed":false,"userId":48},{"id":3,"todo":"Watch a classic movie","completed":false,"userId":4},{"id":4,"todo":"Contribute code or a monetary donation to an open-source software project","completed":false,"userId":48},{"id":5,"todo":"Solve a Rubik's cube","completed":false,"userId":31},{"id":6,"todo":"Bake pastries for me and neighbor","completed":false,"userId":39},{"id":7,"todo":"Go see a Broadway production","completed":false,"userId":32},{"id":8,"todo":"Write a thank you letter to an influential person in my life","completed":true,"userId":13},{"id":9,"todo":"Invite some friends over for a game night","completed":false,"userId":47},{"id":10,"todo":"Have a football scrimmage with some friends","completed":false,"userId":19},{"id":11,"todo":"Text a friend I haven't talked to in a long time","completed":false,"userId":39},{"id":12,"todo":"Organize pantry","completed":true,"userId":39},{"id":13,"todo":"Buy a new house decoration","completed":false,"userId":16},{"id":14,"todo":"Plan a vacation I've always wanted to take","completed":false,"userId":28},{"id":15,"todo":"Clean out car","completed":false,"userId":33},{"id":16,"todo":"Draw and color a Mandala","completed":true,"userId":24},{"id":17,"todo":"Create a cookbook with favorite recipes","completed":false,"userId":1},{"id":18,"todo":"Bake a pie with some friends","completed":false,"userId":1},{"id":19,"todo":"Create a compost pile","completed":true,"userId":5},{"id":20,"todo":"Take a hike at a local park","completed":true,"userId":43},{"id":21,"todo":"Take a class at local community center that interests you","completed":false,"userId":22},{"id":22,"todo":"Research a topic interested in","completed":false,"userId":4},{"id":23,"todo":"Plan a trip to another country","completed":true,"userId":37},{"id":24,"todo":"Improve touch typing","completed":false,"userId":45},{"id":25,"todo":"Learn Express.js","completed":false,"userId":49},{"id":26,"todo":"Learn calligraphy","completed":false,"userId":50},{"id":27,"todo":"Have a photo session with some friends","completed":false,"userId":14},{"id":28,"todo":"Go to the gym","completed":false,"userId":15},{"id":29,"todo":"Make own LEGO creation","completed":false,"userId":30},{"id":30,"todo":"Take cat on a walk","completed":false,"userId":15}]
/// total : 150
/// skip : 0
/// limit : 30

TodasModel todasModelFromJson(String str) => TodasModel.fromJson(json.decode(str));
String todasModelToJson(TodasModel data) => json.encode(data.toJson());
class TodasModel {
  TodasModel({
      List<Todos>? todos, 
      num? total, 
      num? skip, 
      num? limit,}){
    _todos = todos;
    _total = total;
    _skip = skip;
    _limit = limit;
}

  TodasModel.fromJson(dynamic json) {
    if (json['todos'] != null) {
      _todos = [];
      json['todos'].forEach((v) {
        _todos?.add(Todos.fromJson(v));
      });
    }
    _total = json['total'];
    _skip = json['skip'];
    _limit = json['limit'];
  }
  List<Todos>? _todos;
  num? _total;
  num? _skip;
  num? _limit;
TodasModel copyWith({  List<Todos>? todos,
  num? total,
  num? skip,
  num? limit,
}) => TodasModel(  todos: todos ?? _todos,
  total: total ?? _total,
  skip: skip ?? _skip,
  limit: limit ?? _limit,
);
  List<Todos>? get todos => _todos;
  num? get total => _total;
  num? get skip => _skip;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_todos != null) {
      map['todos'] = _todos?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['skip'] = _skip;
    map['limit'] = _limit;
    return map;
  }

}

/// id : 1
/// todo : "Do something nice for someone I care about"
/// completed : true
/// userId : 26

Todos todosFromJson(String str) => Todos.fromJson(json.decode(str));
String todosToJson(Todos data) => json.encode(data.toJson());
class Todos {
  Todos({
      num? id, 
      String? todo, 
      bool? completed, 
      num? userId,}){
    _id = id;
    _todo = todo;
    _completed = completed;
    _userId = userId;
}

  Todos.fromJson(dynamic json) {
    _id = json['id'];
    _todo = json['todo'];
    _completed = json['completed'];
    _userId = json['userId'];
  }
  num? _id;
  String? _todo;
  bool? _completed;
  num? _userId;
Todos copyWith({  num? id,
  String? todo,
  bool? completed,
  num? userId,
}) => Todos(  id: id ?? _id,
  todo: todo ?? _todo,
  completed: completed ?? _completed,
  userId: userId ?? _userId,
);
  num? get id => _id;
  String? get todo => _todo;
  bool? get completed => _completed;
  num? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['todo'] = _todo;
    map['completed'] = _completed;
    map['userId'] = _userId;
    return map;
  }

}