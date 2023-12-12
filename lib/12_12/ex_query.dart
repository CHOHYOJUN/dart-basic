// 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
// 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
// 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
// 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
// 5. 밀라노에 거래자가 있는가?
// 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
// 7. 전체 트랜잭션 중 최대값은 얼마인가?
// 8. 전체 트랜잭션 중 최소값은 얼마인가?

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return 'Trader{name: $name, city: $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return 'Transaction{trader: $trader, year: $year, value: $value}';
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main() {
  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  List<Transaction> ex1Transactions = List<Transaction>.from(transactions)
      .where((e) => e.year == 2011)
      .toList()
    ..sort((a, b) => a.value.compareTo(b.value));

  List<String> traderNames = ex1Transactions.map((e) => e.trader.name).toList();

  toPrint(1, traderNames); // [Brian, Raoul]

  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  List<String> ex2Transactions = List<Transaction>.from(transactions)
      .map((e) => e.trader.city)
      .toSet()
      .toList();
  toPrint(2, ex2Transactions); // [Cambridge, Milan]

  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오

  List<String> ex3Transactions = List<Transaction>.from(transactions)
      .where((e) => e.trader.city == 'Cambridge')
      .map((e) => e.trader.name)
      .toSet()
      .toList()
    ..sort((a, b) => a.compareTo(b));

  toPrint(3, ex3Transactions); // [Alan, Brian, Raoul]

  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  List<String> ex4Transactions = List<Transaction>.from(transactions)
      .map((e) => e.trader.name)
      .toSet()
      .toList()
    ..sort((a, b) => a.compareTo(b));

  toPrint(4, ex4Transactions); // [Alan, Brian, Mario, Raoul]

  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  // 5. 밀라노에 거래자가 있는가?
  bool ex5Transactions =
      List<Transaction>.from(transactions).any((e) => e.trader.city == 'Milan');

  toPrint(5, ex5Transactions); // true

  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  List<Trader> ex6Transactions = List<Transaction>.from(transactions)
      .where((e) => e.trader.city == 'Cambridge')
      .map((e) => e.trader)
      .toList();
  toPrint(6, ex6Transactions.toString());

  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  int maxValue = List<Transaction>.from(transactions)
      .map((transaction) => transaction.value)
      .reduce((value1, value2) => value1 > value2 ? value1 : value2);
  toPrint(7, maxValue); // 1000

  //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  int minValue = List<Transaction>.from(transactions)
      .map((transaction) => transaction.value)
      .reduce((value1, value2) => value1 < value2 ? value1 : value2);
  toPrint(8, minValue); // 300
}

void toPrint(int num, Object data) => print('${num}ex) - ${data}');
