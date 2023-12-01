class Goods {
  String? name;
  int? price;
  int? _count;

  // Drink 클래스 내부에서만 호출 가능한 private 생성자
  Goods._builder();

  // factory 생성자는 클래스의 인스턴스를 생성하여 반환하는 로직을 정의
  factory Goods({
    String? name,
    int? price,
    int? count,
  }) {
    return Goods._builder()
      ..name = name
      ..price = price
      .._count = count;
  }


  int? get count => _count; // count만 setter 추가

  set count(int? value) => _count = value;

  @override
  String toString() {
    return ' $name, 가격: $price원, 수량: $_count개';
  }

/**
 * java로 변환했을때는
  public class Googs {
    private String name; int price;
    private int count;

    private Googs() {
        // private 생성자
    }

    public static Googs create(String name, int price, int count) {
        Googs googs = new Googs();
        googs.name = name;
        googs.price = price;
        googs.count = count;
        return googs;
      }
  }
  **/
}
