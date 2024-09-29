
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/models/user_model.dart';

void main() {
	group('User Model', () {
		test('User model can be instantiated', () {
			final user = User(email: 'test@example.com', password: 'password123');
			expect(user, isA<User>());
		});

		test('User model serialization', () {
			final user = User(email: 'test@example.com', password: 'password123');
			final userJson = user.toJson();
			expect(userJson, {'email': 'test@example.com', 'password': 'password123'});
		});

		test('User model deserialization', () {
			final userJson = {'email': 'test@example.com', 'password': 'password123'};
			final user = User.fromJson(userJson);
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
	});
}
