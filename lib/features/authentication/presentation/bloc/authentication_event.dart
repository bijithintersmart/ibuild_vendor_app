part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.started() = _Started;
  const factory AuthenticationEvent.loginUser({
    required String email,
    required String password,
    required BuildContext context,
    @Default(true) bool enableNavigation,
  }) = _LoginUser;
  const factory AuthenticationEvent.otherLogins({
    required String email,
    required BuildContext context,
  }) = _OtherLogins;
  const factory AuthenticationEvent.forgotPassword({
    required String email,
    required BuildContext context,
  }) = _ForgotPassword;
  const factory AuthenticationEvent.registerUser(
      {required String email,
      required String password,
      required String name,
      required String confirmPassword,
      required BuildContext context,
      @Default(true) bool enableNavigation}) = _RegisterUser;
  const factory AuthenticationEvent.getUserData() = _GetUserData;
  const factory AuthenticationEvent.logout() = _Logout;
}
