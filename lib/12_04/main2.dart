import 'Person.dart';

/// 컬렉션 예제
void main(){

  // [연습문제 2-1]
  // 1) 대한민국의 도시 이름 모음 (순서 상관 없음) - Set
  // 2) 10명 학생의 시험 점수 - Map
  // 3) 대한민국의 도시별 인구수 (순서 상관 없음) - Map


  // [연습문제 2-2]
  // 1) 이름을 가지는 Person 클래스를 작성하시오. Person 을 반드시 이름을 포함해야 합니다.
  // 2) 이름이 '홍길동'. '한석봉'인 Person 인스턴스를 생성하고, List에 담습니다.
  // 3) List에 담긴 모든 Person 인스턴스의 이름을 표시하시오.

  Person hong = Person(name:'홍길동',age:20);
  Person han = Person(name:'한석봉',age:25);
  List<Person> personList = <Person>[];
  personList.add(hong);
  personList.add(han);

  for (Person person in personList) {
    print(person.name);
  }


  // [연습문제 2-3]
  // 연습문제 2-2 에서 작성한 Person 클래스로 생성한 ‘홍길동’, ‘한석봉'의 나이를 각각 20, 25살 이라고 할 때, 이름과 나이를 쌍으로 적당한 컬렉션에 넣습니다.
  // 그 다음, 컬렉션에 저장한 값을 하나씩 다음과 같이 출력합니다.
  // “홍길동의 나이는 20살”
  // “한석봉의 나이는 25살”


  // 체이닝 테스트
  <Person>[Person(name: '홍길동', age: 20), Person(name: '한석봉', age: 25)]
      .fold<Map<String, int>>(
          {},
          (map, person) => map
            ..[person.name] =
                person.age).forEach((key, value) => print('$key의 나이는 $value살'))
  ;

}