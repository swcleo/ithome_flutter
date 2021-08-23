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

  User(this.name, {Age? age}) {
    if (age != null) {
      this._age = age;
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
  var user = User("Leo", age: Age(35));
  print(user.age); // 35
}
