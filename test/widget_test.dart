import 'package:flutter_test/flutter_test.dart';
import 'package:testproject/main.dart';

void main() {
  testWidgets('SalaryApp smoke test', (WidgetTester tester) async {
    // 1. Folosește SalaryApp() în loc de DiscountApp()
    await tester.pumpWidget(const SalaryApp());

    // 2. Verifică dacă titlul "Salary Calculator" este afișat
    expect(find.text('Salary Calculator'), findsOneWidget);

    // 3. Verifică dacă butonul de calcul există
    expect(find.text('Calculate Salary'), findsOneWidget);
  });
}