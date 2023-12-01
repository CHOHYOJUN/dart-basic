import 'package:untitled/11_30/Goods.dart';

class Manager {

  List<Goods> googsList = [];
  int myMoney = 0;

  Manager() {
    init();
  }

  init() {
    Goods chocolate = Goods(
      name: "초콜릿",
      price: 500,
      count: 5,
    );

    Goods piko = Goods(
      name: "빼빼로",
      price: 600,
      count: 5,
    );

    Goods fanta = Goods(
      name: "환타",
      price: 1000,
      count: 5,
    );

    Goods sprite = Goods(
      name: "사이다",
      price: 1100,
      count: 5,
    );

    Goods goods = Goods()
      ..name = "음료"
      ..price = 1000
      ..count = 2;

    googsList.add(chocolate);
    googsList.add(piko);
    googsList.add(fanta);
    googsList.add(sprite);

  }
}
