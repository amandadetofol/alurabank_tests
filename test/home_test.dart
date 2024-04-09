import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_http_mock.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final mockHttp = BankHttpMock().dolarToReal();

  testWidgets("My widget has a text Spent", (widgetTester) async {
    //Desenha o widget na tela
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api: mockHttp),
      ),
    ));

    final spentFinder = find.text("Spent");

    expect(spentFinder, findsOneWidget);
  });

  testWidgets("Finds a LinearProgressIndicator", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api: mockHttp),
      ),
    ));

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets("Finds account status widget with key: testKey", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api:mockHttp),
      ),
    ));

    expect(find.byKey(Key("testKey")), findsOneWidget);
  });

  testWidgets("Finds 5 boxcards", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api: mockHttp),
      ),
    ));

    expect(find.byWidgetPredicate((widget) {  
      return widget is BoxCard;
    }), findsNWidgets(5));
  });

  testWidgets("Click on deposit should upload earned in 10", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: Home(api: BankHttpMock().dolarToReal()),
      ),
    ));

   await widgetTester.tap(find.text("Deposit"));
   await widgetTester.tap(find.text("Earned"));
   await widgetTester.tap(find.text("Available balance"));
   
   await widgetTester.pumpAndSettle(const Duration(seconds: 10));

   expect(find.text("\$10.0"), findsNWidgets(2));
  });

}
