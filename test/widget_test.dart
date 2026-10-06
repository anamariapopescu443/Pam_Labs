import 'package:flutter_test/flutter_test.dart';
import 'package:testproject/main.dart';

void main() {
  testWidgets('FitnessApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const FitnessApp());

    // Verify greeting text
    expect(find.text('Good Morning'), findsOneWidget);

    // Verify challenge card text
    expect(find.text("Today's Challenge"), findsOneWidget);

    // Verify featured plan title
    expect(find.text('Featured Plan'), findsOneWidget);
  });
}
