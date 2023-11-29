mixin Flyable on Animal {
  void fly() {
    print('I am flying!');
  }
}

class Animal {
  String name;

  Animal(this.name);
}

class Bird extends Animal with Flyable {
  // Bird는 Animal의 모든 속성과 메소드를 가지며,
  // Flyable mixin에서 제공하는 fly() 메소드도 가지고 있다.

  Bird(String name) : super(name);
}

