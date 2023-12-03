

List<Human> humanList =[];

void main() {

  // -- 상속(형변환)

  // 부모타입으로 받기
  Human human1 = Student(name: 'messi', age: 35, studentNo: 'S01');
  Human human2 = Professor(name: 'Pep', age: 52, major: 'football');


  // 형변환 즉시 참조 할 경우
  // print((human1 as Student).studentNo);
  // print((human2 as Professor).major);


  Student student = human1 as Student;
  Professor professor = human2 as Professor;


  print(student.runtimeType); // Student
  print(professor.runtimeType); // Professor

  print( student.runtimeType == Human); // false
  print( student.runtimeType == Student); // true

  print(student is Human); // true
  print(student is Student); // true

  // ----


  /// 상수 생성자

  /// 1. 같은 인스턴스
  // ImmutablePoint immutablePoint1 = const ImmutablePoint(3,7);
  // ImmutablePoint immutablePoint2 = const ImmutablePoint(3,7);
  // assert(identical(immutablePoint1,immutablePoint2));

  /// 2. 다른 인스턴스
  ImmutablePoint immutablePoint1 = const ImmutablePoint(3,7);
  ImmutablePoint immutablePoint2 =  ImmutablePoint(3,7);
  assert(!identical(immutablePoint1,immutablePoint2));

}


class ImmutablePoint {

  final double x, y;
  const ImmutablePoint(this.x, this.y);
}

class Human {
  String name;
  int age;

  Human({
    required this.name,
    required this.age,
  });
}

class Student extends Human {
  String studentNo; // 학번
  String? subject; // 과목

  Student({required super.name, required super.age, required this.studentNo, this.subject});

  @override
  String toString() {
    String name = super.name;
    int age = super.age;
    String studentNo = this.studentNo;
    String subject = this.subject??'';
    return '- 학생정보: [ name: $name / age: $age / studentNo: $studentNo / subject: $subject ]';
  }
}

class Professor extends Human {
  String major; //전공

  Professor({required super.name, required super.age, required this.major});

  @override
  String toString() {
    String name = super.name;
    int age = super.age;
    String major = this.major;
    return 'name: $name / age: $age / major: $major';
  }



}









