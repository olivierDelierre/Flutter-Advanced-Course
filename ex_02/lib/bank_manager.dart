class BankManager {
  int _balance;
  int get balance => _balance;

  BankManager() : _balance = 0;

  void deposit(int amount) {
    if (amount <= 0) {
      throw Error();
    }

    _balance += amount;
  }

  void withdraw(int amount) {
    if (amount <= 0 || amount > _balance) {
      throw Error();
    }

    _balance -= amount;
  }
}
