part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.loading() = Loading;
  const factory AuthenticationState.errors({
    String? otpError,
    String? emailError,
    String? phoneError,
    String? error,
  }) = AuthError;
  const factory AuthenticationState.userData({required UserModel user}) =
      _UserData;
}
