part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthRegisterLoading extends AuthState{}
final class AuthRegisterSuccess extends AuthState{}
final class AuthRegisterError  extends AuthState{}
final class AuthLoginLoading  extends AuthState{}
final class AuthLoginSuccess  extends AuthState{}
final class AuthLoginError    extends AuthState{}