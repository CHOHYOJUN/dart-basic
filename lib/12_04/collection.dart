

/// 컬렉션 예제 코드
void main(){

  // infoList();

  // infoSet();

  infoMap();

}


void infoList(){

  // 빈 리스트
  List<int> numbers = [];
  final numbers3 = <int>[];

  numbers.add(1);
  numbers.add(2);
  numbers.add(3);
  numbers.add(4);
  numbers.add(5);

  numbers.insert(0, 10);

  print(numbers);

  // dynamic 동적이다.
  // 안티패턴
  final List numbers2 = [];
  numbers2.add(1);
  numbers2.add('2');
  numbers2.add(true);
  numbers2.add(1);

  print(numbers2);

  numbers.asMap().forEach((key, value) {
    print('key: $key  | value: $value');

    print(key == 2);

    if (key == 2) return;
  });

  for(var value in numbers){
    print('value: $value ${value == 2}');
    if(value == 2) return;
  }

}


void infoSet() {
  Set<int> numberSet = {2, 3, 1, 5, 5, 6, 7, 7, 8, 10, 9};

  numberSet.forEach((value) {
    print(value);
  });
}

void infoMap(){
  Map<String, dynamic> testMap = {
    'name' : 'messi',
    'age' : 35,
    'type' : 'hero'
  };

  print(testMap['name']);
  print(testMap['age']);
  print(testMap['type']);

  var age = testMap['age'];

  print(age.runtimeType);

}