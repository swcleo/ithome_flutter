class Area {
  String city = "";
  Area(this.city);
}

class User {
  final String name; // 不可為 const
  final Area area;

  User(this.name, this.area);

  // 使用 const 需加上 static
  static const value = 999;
}

void main() {
  final aFinalStr = "hi";
  // aFinalStr = "cc";  // 不可修改
  print(aFinalStr);

  const bConstStr = "hello";
  // bConstStr = "cc";  // 不可修改
  print(bConstStr);

  var user = User("Leo", Area("Taiwan"));
  // user.name = "cc"; // 不可修改
  print(user.name);
  print(user.area.city);
  user.area.city = "Taipei";
  // user.area = Area("Tainan"); // 不可修改
  print(user.area.city); // 被異動了

  print(User.value);
}
