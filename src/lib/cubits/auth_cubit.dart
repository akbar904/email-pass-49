
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/user_model.dart';

// AuthState and its subclasses
abstract class AuthState extends Equatable {
	const AuthState();
	
	@override
	List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
	final User user;

	const AuthAuthenticated(this.user);

	@override
	List<Object> get props => [user];
}

class AuthError extends AuthState {
	final String message;

	const AuthError(this.message);

	@override
	List<Object> get props => [message];
}

// AuthCubit
class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) {
		emit(AuthLoading());
		try {
			// Simulate a login process
			if (email == 'test@example.com' && password == 'password123') {
				final user = User(email: email, password: password);
				emit(AuthAuthenticated(user));
			} else {
				emit(AuthError('Login failed'));
			}
		} catch (e) {
			emit(AuthError('Login failed'));
		}
	}

	void logout() {
		emit(AuthLoading());
		emit(AuthInitial());
	}
}
