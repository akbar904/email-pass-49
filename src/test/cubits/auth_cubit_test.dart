
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/cubits/auth_cubit.dart';
import 'package:my_flutter_app/models/user_model.dart';

class MockUser extends Mock implements User {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;
		late MockUser mockUser;

		setUp(() {
			authCubit = AuthCubit();
			mockUser = MockUser();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthInitial', () {
			expect(authCubit.state, equals(AuthInitial()));
		});

		blocTest<AuthCubit, AuthState>(
			'emit [AuthLoading, AuthAuthenticated] when login is successful',
			build: () => authCubit,
			act: (cubit) {
				when(() => mockUser.email).thenReturn('test@example.com');
				when(() => mockUser.password).thenReturn('password123');
				cubit.login('test@example.com', 'password123');
			},
			expect: () => [AuthLoading(), AuthAuthenticated(mockUser)],
		);

		blocTest<AuthCubit, AuthState>(
			'emit [AuthLoading, AuthError] when login fails',
			build: () => authCubit,
			act: (cubit) => cubit.login('wrong@example.com', 'wrongpassword'),
			expect: () => [AuthLoading(), AuthError('Login failed')],
		);

		blocTest<AuthCubit, AuthState>(
			'emit [AuthLoading, AuthInitial] when logout is called',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [AuthLoading(), AuthInitial()],
		);
	});
}
