import 'package:test/test.dart';
import 'package:untitled/12_18/account.dart';

void main() {

  test('계좌 이체가 잘 동작 해야한다. ', () {
    // given
    Account a = Account(owner: ('홍길동'), balance: 1000);
    Account b = Account(owner: ('한석봉'), balance: 0);

    // when
    a.transfer(b, 500);

    // then
    expect(a.balance, 500);
    expect(b.balance, 500);
  });


  test('계좌 이체가 잘 동작 해야한다. ', () {
    // given
    Account a = Account(owner: ('홍길동'), balance: 400);
    Account b = Account(owner: ('한석봉'), balance: 0);

    // when
    a.transfer(b, 500);

    // then
    expect(a.balance, 500);
    expect(b.balance, 500);

    expect(()=> a.transfer(b, 600), throwsException );

  });


}
