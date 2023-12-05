import 'dart:io';

/// 상속과 형변환, 리턴타입 연습용 CRUD 연습 예제
void main() {
  Manager manager = Manager();
  manager.onPlay();
}

class Manager {
  List<Human> humanList = [];

  /// @기능 :  메인 홈 화면 출력
  /// @input : x
  /// @return : String
  String? viewMenu() {
    print("■■■■■■■■■■■■ [ 학사 관리 시스템 ] ■■■■■■■■■■■■");
    print(" 1.등록 | 2.검색 | 3.삭제 | 4.수정 | 5.전체리스트 | 0.종료 ");
    print("번호를 입력해주세요.");
    String? input = stdin.readLineSync();
    print("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
    print("");
    return input;
  }

  /// @기능 :  메인 홈 화면 출력
  /// @input : x
  /// @return : String
  void onPlay() {
    while (true) {
      String? input = viewMenu();

      switch (input) {
        case '1':
          // 등록
          createHuman();
          break;
        case '2':
          // 검색
          if(humanList.isNotEmpty){
            Human getHuman = selectHuman();
            onePrint(human: getHuman);
          }else{
            print('조회 대상 없음.');
          }

          break;
        case '3':
          // 삭제
          if(humanList.isNotEmpty){
            bool isDelete = deleteHuman();
            isDelete ? print('- 삭제 성공') : print('- 삭제 실패');
          }else{
            print('조회 대상 없음.');
          }
          break;
        case '4':
          // 수정
          if (humanList.isNotEmpty) {
            bool isUpdate = updateHuman();
            isUpdate ? print('- 수정 성공') : print('- 수정 실패');
          } else {
            print('조회 대상 없음.');
          }
          break;
        case '5':
          // 전체리스트
          allPrint();
          break;
        case '0':
          // 프로그램 종료
          exit(0);
        default:
          print("다른 번호를 입력해주세요.");
          viewMenu();
      }
    }
  } // onPlay() - end

  /// @기능 :  학생,교수 등록
  /// @input : x
  /// @return : void
  void createHuman() {
    print('1.학생 | 2. 교수');
    String? input = stdin.readLineSync();

    int id = humanList.length;

    print('- 이름: ');
    String name = stdin.readLineSync() ?? '';

    print('- 나이: ');
    int? age = int.parse(stdin.readLineSync()!);

    if (input == '1') {
      // 학생
      print('- 학년: ');
      String grade = stdin.readLineSync() ?? '';
      Student student = Student(grade: grade, name: name, age: age, id: id);
      humanList.add(student);

    } else if (input == '2') {
      // 교수
      print('전공을 입력해주세요');
      String? major = stdin.readLineSync() ?? '';
      Professor professor = Professor(major: major, name: name, age: age, id: id);
      humanList.add(professor);

    } else {
      return print('다시 입력해주세요');
    }
  } // createHuman() - end


  /// @기능 :  등록한 학생,교수 전체 출력
  /// @input : x
  /// @return : void
  void allPrint() {
    if (humanList.isEmpty) return print('조회할 내용이 없습니다.');

    for (Human human in humanList) {
      if (human.runtimeType == Student) {
        Student st = human as Student;
        print(
            '- id: ${st.id} , 이름: ${st.name} , 나이: ${st.age} , 학년: ${st.grade} , 수학점수: ${st.mathScore} , 영어점수: ${st.englishScore}');
      } else if (human.runtimeType == Professor) {
        Professor pro = human as Professor;
        print(
            '- id: ${pro.id} , 이름: ${pro.name} , 나이: ${pro.age} , 전공: ${pro.major}');
      } else {
        return print('다시 입력해주세요.');
      }
    }
  } // allPrint() - end


  /// @기능 : 학생,교수 (1)정보 출력
  /// @input : Human
  /// @return : void
  void onePrint({required Human human}) {
    if(humanList.isEmpty)return print('조회할 내용이 없습니다.');

    // 학생, 교수 구분 후 출력한다.
    print(human);
  } // onePrint() - end


  /// @기능 : 검색 조건에 대해 검색 후 Human객체 조회 하는 기능
  /// @input : x
  /// @return : Human
  Human selectHuman() {
    // Todo 1: id, 이름, 학생, 교수 등 조회 기능
    // Todo 2: 조건에 따라 형변환 필요
    // Todo 3: 검색 조건 로직 작성 후 Human객체 리턴

    Human getHuman = humanList.firstWhere((human) => human.id == 0);

    return getHuman;
  } // selectHuman() - end


  /// @기능 : 검색 조건에 대해 검색 후 Human정보 삭제하는 기능
  /// @input : x
  /// @return : bool
  bool deleteHuman(){
    bool isDelete = false;

    if (humanList.isNotEmpty) {
      // Todo 1: selectHuman() 호출하여 Human객체를 찾아온다. - 기존 검색 기능 재사용

      Human getHuman = selectHuman();

      // Todo 2: 찾아온 객체 데이터를 humanList에서 삭제한다.

      // Todo 3: 삭제 성공시 'isDelete'를 true 처리 하여 리턴한다.
    }
      return isDelete;
  }


  /// @기능 : 검색 조건에 대해 검색 후 Human정보 수정하는 기능
  /// @input : x
  /// @return : bool
  bool updateHuman(){
    bool isUpdate = false;
    if (humanList.isNotEmpty) {
      // Todo 1: selectHuman() 호출하여 Human객체를 찾아온다. - 기존 검색 기능 재사용
      Human getHuman = selectHuman();

      // Todo 2: null 아니거나 정상적으로 찾아왔을시 수정할 내용을 입력 받는다. (학생/교수) 구분.
      // ㄴ 학생, 학년, 수학점수, 영어점수 등

      // Todo 3: 찾아온 객체 데이터를 humanList 에서 찾아서 입력 받은 내용으로 값을 변경한다.


      // Todo 4: 수정 성공시 'isUpdate'를 true 처리 하여 리턴한다.
    }
    return isUpdate;
  }

}

//ㅡㅡㅡ [ Human ] ㅡㅡㅡ
class Human {
  String name;
  int age;
  int id;

  Human({
    required this.name,
    required this.age,
    required this.id,
  });

  @override
  String toString() {
    return 'Human{name: $name, age: $age, id: $id}';
  }
}

//ㅡㅡㅡ [ Student ] ㅡㅡㅡ
class Student extends Human {
  String grade;
  int mathScore = 0;
  int englishScore = 0;

  Student({
    required this.grade,
    required super.name,
    required super.age,
    required super.id,
  });

  @override
  String toString() {
    return 'Student{grade: $grade, mathScore: $mathScore, englishScore: $englishScore}';
  }
}

//ㅡㅡㅡ [ Professor ] ㅡㅡㅡ
class Professor extends Human {
  String major;

  Professor({
    required this.major,
    required super.name,
    required super.age,
    required super.id,
  });

  @override
  String toString() {
    return 'Professor{major: $major}';
  }
}
