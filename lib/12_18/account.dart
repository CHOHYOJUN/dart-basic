class Account {
  String owner;
  int balance;

  Account({
    required this.owner,
    required this.balance,
  });

  void transfer(Account dest, int amount) {
    if (balance < amount) {
      throw Exception('잔액이 부족합니다.');
    }

    balance -= amount;
    dest.balance += amount;
  }
}
