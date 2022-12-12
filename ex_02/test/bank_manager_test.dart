import 'package:ex_02/bank_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late BankManager b;
  setUp(() => b = BankManager());

  group('Deposit testing', () {
    test('Deposit should act on the balance', () {
      b.deposit(12);
      expect(b.balance, 12);

      b.deposit(20);
      expect(b.balance, 32);
    });

    test('Cannot deposit a value lower or equal than zero.', () {
      expect(() => b.deposit(0), throwsA(isA<Error>()), reason: 'Should not be able to deposit zero.');
      expect(() => b.deposit(-1), throwsA(isA<Error>()), reason: 'Should not be able to deposit negative value.');
    });
  });

  group('Withdraw testing', () {
    test('Withdraw should act on the balance', () {
      b.deposit(150);

      b.withdraw(10);
      expect(b.balance, 140);

      b.withdraw(32);
      expect(b.balance, 108);
    });

    test('Cannot withdraw a value lower or equal than zero.', () {
      b.deposit(120);

      expect(() => b.withdraw(0), throwsA(isA<Error>()), reason: 'Should not be able to withdraw zero.');
      expect(() => b.withdraw(-1), throwsA(isA<Error>()), reason: 'Should not be able to withdraw negative value.');
    });

    test('Cannot withdraw more than the balance.', () {
      b.deposit(110);

      expect(() => b.withdraw(151), throwsA(isA<Error>()),
          reason: 'Should not be able to withdraw more than the balance.');
    });
  });
}
