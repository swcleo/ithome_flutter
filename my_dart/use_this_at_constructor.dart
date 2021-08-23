enum JOB { NEW, FIGHTER, WARRIOR }

class Fighter extends Player {
  final JOB _job = JOB.FIGHTER;
  Fighter(name) : super(name: name);
}

class Warrior extends Player {
  final JOB _job = JOB.WARRIOR;
  Warrior(name) : super(name: name);
}

class Player {
  String name;

  JOB _job;

  // 在建構式中使用 this，可以用來對應類別的屬性
  Player({required this.name}) : _job = JOB.NEW;

  // 在建構式函式執行可使用 (:) 進行初始化的動作
  Player.fighter({required this.name}) : _job = JOB.FIGHTER {
    print("Build: Player.fighter [$job]");
  }

  // 可以定義不同建構方法
  // 此類別重新轉達其他的建構方法 (這邊範例實作命名參數轉成位置參數的建構方法)
  Player.fromFighter(String name) : this.fighter(name: name);

  // 工廠方式，使用 factory 宣告讓方式會返回 子類別 或是 null
  factory Player.fromJson(Map<String, String> json) {
    var name = json['name']!;
    var job = json['job']!;
    if (job == 'fighter') return Fighter(name);
    if (job == 'warrior') return Warrior(name);

    throw ArgumentError('Unrecognized $job');
  }

  get job {
    return this._job;
  }

  toSring() {
    return "$name $job";
  }
}

void main() {
  var newPlayer = Player(name: "新手");
  print(newPlayer.toSring());

  var fighter = Player.fromFighter("戰士");
  print(fighter.toSring());

  var warrior = Player.fromJson({"name": "鬥士", "job": "warrior"});
  print(warrior.toSring());
}
