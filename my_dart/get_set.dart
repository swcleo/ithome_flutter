class Age {
  int age;
  Age(this.age);

  bool get isComeOfAge {
    return age >= 18;
  }
}

class User {
  String name;
  Age? _age;

  User(this.name, [int? age]) {
    if (age != null) {
      this._age = Age(age);
    }
  }

  int? get age {
    return _age?.age;
  }

  set age(int? value) {
    if (value != null) {
      _age = Age(value);
    }
  }

  bool get isComeOfAge {
    return _age!.isComeOfAge;
  }
}

void main() {
  // age 為可選參數
  var user = User("Leo");
  print(user.age); // null

  user.age = 35;
  print(user.age); // 35
  print(user.isComeOfAge); // true
}
