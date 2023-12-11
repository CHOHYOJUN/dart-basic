import 'dart:convert';
import 'dart:io';


/// 여러가지 데이터 형식
/// 연습문제 7-1
void main() {
  Employee employee = Employee('홍길동', 41);
  Department department = Department('총무부', employee);

  //ㅡㅡㅡㅡㅡ [ 객체 -> Json 파일 ] ㅡㅡㅡㅡㅡ

  // 객체를 Json 문자열로 직렬화
  String toJson = jsonEncode(department);

  // 파일 생성
  String path = 'lib/12_11/asset/';
  String fileName1 = 'company.txt';
  File file1 = File(path + fileName1);

  // 파일에 데이터 쓰기
  file1.writeAsStringSync(toJson);

  //ㅡㅡㅡㅡㅡ [ Json 파일 -> 객체 ] ㅡㅡㅡㅡㅡ

  // 파일 생성
  String fileName2= 'fromJson.json';
  File file2 = File(path + fileName2);
  String fromJson = file2.readAsStringSync();

  // String 형태의 Json 데이터를  Map으로 변환(Department 객체로 역직렬화)
  Map<String, dynamic> jsonMap = jsonDecode(fromJson);

  // Map으로 부터 Department 객체 생성
  Department decodedDepartment = Department.fromJson(jsonMap);


  print(decodedDepartment);
  // Department{name: 영업부, leader: Employee{name: ronaldo, age: 38}}

}


class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  // Map으로 부터 객체를 생성하는 생성자.
  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  // 객체를 Json 형태로 표현하는 메서드.
  Map<String, dynamic> toJson() =>  {
        'name': name,
        'age': age,
      };

  @override
  String toString() {
    return 'Employee{name: $name, age: $age}';
  }
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  // Map으로 부터 객체를 생성하는 생성자.
  Department.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        leader = Employee.fromJson(json['leader']);

  // 객체를 Json 형태로 표현하는 메서드.
  Map<String, dynamic> toJson() => {
        'name': name,
        'leader': leader.toJson(),
      };

  @override
  String toString() {
    return 'Department{name: $name, leader: $leader}';
  }

}


