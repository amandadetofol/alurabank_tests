import 'package:estilizacao_componentes/models/bank.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  group("Bank model deposit test", () {

    test("Bank model deposit should turn points to 10", (){
      final bank = BankModel();
      bank.deposit(10.0);

      expect(bank.points, 10.0);
    });

    test("Bank model deposit should turn earned to 10", (){
      final bank = BankModel();
      bank.deposit(10.0);

      expect(bank.earned, 10.0);
    });

    test("Bank model deposit should turn available to 10", (){
      final bank = BankModel();
      bank.deposit(10.0);

      expect(bank.available, 10.0);
    });

    test("Bank model deposit should turn spent to 0", (){
      final bank = BankModel();
      bank.deposit(10.0);

      expect(bank.spent, 0.0);
    });
  });

  test("Bank model transfer should turn points to 10", (){
    final bank = BankModel();
    bank.transfer(10.0);

    expect(bank.earned, 0.0);
    expect(bank.points, 10.0);
    expect(bank.available, -10.0);
    expect(bank.spent, 10.0);
  });

}

