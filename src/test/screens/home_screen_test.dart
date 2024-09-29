
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/home_screen.dart';

class MockAuthCubit extends MockCubit implements AuthCubit {}

void main() {
	group('HomeScreen', () {
		testWidgets('should display a logout button', (WidgetTester tester) async {
			await tester.pumpWidget(MaterialApp(home: HomeScreen()));

			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('should trigger logout when logout button is pressed', (WidgetTester tester) async {
			final mockAuthCubit = MockAuthCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>.value(
						value: mockAuthCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
