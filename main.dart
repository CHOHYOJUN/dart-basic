// 4명의 플레이어 참가

// TODO: 1
// 4명의 플레이어가 순서대로 돌아간다.
// 1 ~ 100까지 반복한다.
// 30 배수 = 'ahh'
// 10의 배수 = 'rool'
// 3의 배수 = 'clap'
// 나머지는 숫자 출력

// TODO: 2
// clap,rool,ahh 총 개수 출력
// 플레이어당 clap을 했는지 출력
// 가장많은 clap을 한 player 출력

class Player {
  String name = '';
  int clapCount = 0;
  int ahhCount = 0;
  int rollCount = 0;

  Player(this.name);

  String speak(int num) {
    if (num % 30 == 0) {
      ahhCount++;
      return 'ahh';
    } else if (num % 10 == 0) {
      rollCount++;
      return 'rool';
    } else if (num % 3 == 0) {
      clapCount++;
      return 'clap';
    } else {
      return '${num}';
    }
  }
}

void main() {
  // 플레이어 1 ~ 4 생성
  List<Player> playerList =
      List.generate(4, (index) => Player('Player${index + 1}'));

  // 1~100 리스트 생성
  List<int> numberList = List.generate(100, (index) => index + 1);

  // 유저 카운팅 인덱스
  int playerIndex = 0;

  numberList.forEach((number) {
    // 출력할 메세지
    String msg = playerList[playerIndex].speak(number);

    // 메인 출력
    print('${playerList[playerIndex].name} : $msg');

    // 유저 카운팅
    playerIndex = (playerIndex + 1) % playerList.length;
  });

  print('');

  // 각 최대값 조회
  int maxAhn = playerList.fold(0, (previousValue, element) => element.ahhCount + previousValue);
  int maxClap = playerList.fold(0, (previousValue, element) => element.clapCount + previousValue);
  int maxRool = playerList.fold(0, (previousValue, element) => element.rollCount + previousValue);

  // clap유저 찾기
  Player maxClapPlayer =
      playerList.reduce((a, b) => a.clapCount > b.clapCount ? a : b);

  print('chap의 총 갯수:${maxClap}');
  print('rool의 총 갯수:${maxRool}');
  print('ahh의 총 갯수:${maxAhn}');

  print('');

  print('가장 많은 clap을 출력한 플레이어: ${maxClapPlayer.name}');
}
