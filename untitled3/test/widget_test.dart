class Person {
  // late String name;
  // late int age;

  String? name;
  int? age;

  // ?표시는 null 이 들어 갈 수도 있다는 의미로 사용
  // ?표시 없이 late 를 쓰면 null 을 허용 하지 않는다.

  Person({required this.name, this.age}) {}
}

void main() {
  Person ps = new Person(name: "GOD", age: 30);
  print(ps.name);
  print(ps.age);
}
