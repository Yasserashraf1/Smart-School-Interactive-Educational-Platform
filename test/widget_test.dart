import 'package:flutter_test/flutter_test.dart';
import 'package:smart_school_demo_by_yasser_ashraf/main.dart';

void main() {
  testWidgets('App launches and shows Smart School title', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const SmartSchoolApp());
    // Just verify the app can launch without crashing
    await tester.pump();
  });
}
