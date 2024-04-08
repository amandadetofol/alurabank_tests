import 'package:estilizacao_componentes/components/box_card.dart';
import 'package:estilizacao_componentes/data/bank_inherited.dart';
import 'package:estilizacao_componentes/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("My widget has a text Spent", (widgetTester) async {
    //Desenha o widget na tela
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: const Home(),
      ),
    ));

    final spentFinder = find.text("Spent");

    expect(spentFinder, findsOneWidget);
  });

  testWidgets("Finds a LinearProgressIndicator", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: const Home(),
      ),
    ));

    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });

  testWidgets("Finds account status widget with key: testKey", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: const Home(),
      ),
    ));

    expect(find.byKey(Key("testKey")), findsOneWidget);
  });

  testWidgets("Finds 5 boxcards", (widgetTester) async {
    await widgetTester.pumpWidget(MaterialApp(
      home: BankInherited(
        child: const Home(),
      ),
    ));

    expect(find.byWidgetPredicate((widget) {  
      return widget is BoxCard;
    }), findsNWidgets(5));
  });

}
