mixin Hello {
  late String name;
  void say() {
    print("Hi, $name !!!");
  }
}

class User with Hello {
  String name;
  User(this.name);
}

void main() {
  var user = User("Leo");
  user.say(); // Hi, Leo !!!
}
