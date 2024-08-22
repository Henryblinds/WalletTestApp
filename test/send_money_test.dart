
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:walletexamapp/main.dart';

void main() {
  testWidgets('Test hide and show and send money', (tester) async {

    await tester.pumpWidget(const MyApp());

    final hideBtn = find.text('hide');
    expect(hideBtn, findsOneWidget);

    expect(find.text('PHP 0.0'), findsOneWidget);

    await tester.tap(hideBtn);
    await tester.pump();

    final showBtn = find.text('show');
    expect(showBtn, findsOneWidget);

    await tester.tap(showBtn);
    await tester.pump();

    expect(find.text('PHP 0.0'), findsNothing);

    final sendMoneyBtn = find.text('Send Money');
    expect(sendMoneyBtn, findsOneWidget);

    await tester.tap(sendMoneyBtn);
    await tester.pumpAndSettle();

    final amountField = find.byType(TextField);
    expect(amountField, findsOneWidget);

    await tester.enterText(amountField, '20');

    final submitBtn = find.text('Submit');
    expect(submitBtn, findsOneWidget);

  });
}