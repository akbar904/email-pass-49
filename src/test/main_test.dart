
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_flutter_app/main.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('Main App Initialization', () {
		testWidgets('App starts with LoginScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());
			
			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});
}
