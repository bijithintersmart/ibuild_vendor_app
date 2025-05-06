// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password,
            BuildContext context, bool enableNavigation)
        loginUser,
    required TResult Function(String email, BuildContext context) otherLogins,
    required TResult Function(String email, BuildContext context)
        forgotPassword,
    required TResult Function(String email, String password, String name,
            String confirmPassword, BuildContext context, bool enableNavigation)
        registerUser,
    required TResult Function() getUserData,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult? Function(String email, BuildContext context)? otherLogins,
    TResult? Function(String email, BuildContext context)? forgotPassword,
    TResult? Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult? Function()? getUserData,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult Function(String email, BuildContext context)? otherLogins,
    TResult Function(String email, BuildContext context)? forgotPassword,
    TResult Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult Function()? getUserData,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_OtherLogins value) otherLogins,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_OtherLogins value)? otherLogins,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_OtherLogins value)? otherLogins,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res, AuthenticationEvent>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res, $Val extends AuthenticationEvent>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password,
            BuildContext context, bool enableNavigation)
        loginUser,
    required TResult Function(String email, BuildContext context) otherLogins,
    required TResult Function(String email, BuildContext context)
        forgotPassword,
    required TResult Function(String email, String password, String name,
            String confirmPassword, BuildContext context, bool enableNavigation)
        registerUser,
    required TResult Function() getUserData,
    required TResult Function() logout,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult? Function(String email, BuildContext context)? otherLogins,
    TResult? Function(String email, BuildContext context)? forgotPassword,
    TResult? Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult? Function()? getUserData,
    TResult? Function()? logout,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult Function(String email, BuildContext context)? otherLogins,
    TResult Function(String email, BuildContext context)? forgotPassword,
    TResult Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult Function()? getUserData,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_OtherLogins value) otherLogins,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_Logout value) logout,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_OtherLogins value)? otherLogins,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_Logout value)? logout,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_OtherLogins value)? otherLogins,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthenticationEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LoginUserImplCopyWith<$Res> {
  factory _$$LoginUserImplCopyWith(
          _$LoginUserImpl value, $Res Function(_$LoginUserImpl) then) =
      __$$LoginUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String email,
      String password,
      BuildContext context,
      bool enableNavigation});
}

/// @nodoc
class __$$LoginUserImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$LoginUserImpl>
    implements _$$LoginUserImplCopyWith<$Res> {
  __$$LoginUserImplCopyWithImpl(
      _$LoginUserImpl _value, $Res Function(_$LoginUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? context = null,
    Object? enableNavigation = null,
  }) {
    return _then(_$LoginUserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      enableNavigation: null == enableNavigation
          ? _value.enableNavigation
          : enableNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginUserImpl implements _LoginUser {
  const _$LoginUserImpl(
      {required this.email,
      required this.password,
      required this.context,
      this.enableNavigation = true});

  @override
  final String email;
  @override
  final String password;
  @override
  final BuildContext context;
  @override
  @JsonKey()
  final bool enableNavigation;

  @override
  String toString() {
    return 'AuthenticationEvent.loginUser(email: $email, password: $password, context: $context, enableNavigation: $enableNavigation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.enableNavigation, enableNavigation) ||
                other.enableNavigation == enableNavigation));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, password, context, enableNavigation);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginUserImplCopyWith<_$LoginUserImpl> get copyWith =>
      __$$LoginUserImplCopyWithImpl<_$LoginUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password,
            BuildContext context, bool enableNavigation)
        loginUser,
    required TResult Function(String email, BuildContext context) otherLogins,
    required TResult Function(String email, BuildContext context)
        forgotPassword,
    required TResult Function(String email, String password, String name,
            String confirmPassword, BuildContext context, bool enableNavigation)
        registerUser,
    required TResult Function() getUserData,
    required TResult Function() logout,
  }) {
    return loginUser(email, password, context, enableNavigation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult? Function(String email, BuildContext context)? otherLogins,
    TResult? Function(String email, BuildContext context)? forgotPassword,
    TResult? Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult? Function()? getUserData,
    TResult? Function()? logout,
  }) {
    return loginUser?.call(email, password, context, enableNavigation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult Function(String email, BuildContext context)? otherLogins,
    TResult Function(String email, BuildContext context)? forgotPassword,
    TResult Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult Function()? getUserData,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (loginUser != null) {
      return loginUser(email, password, context, enableNavigation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_OtherLogins value) otherLogins,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_Logout value) logout,
  }) {
    return loginUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_OtherLogins value)? otherLogins,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_Logout value)? logout,
  }) {
    return loginUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_OtherLogins value)? otherLogins,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (loginUser != null) {
      return loginUser(this);
    }
    return orElse();
  }
}

abstract class _LoginUser implements AuthenticationEvent {
  const factory _LoginUser(
      {required final String email,
      required final String password,
      required final BuildContext context,
      final bool enableNavigation}) = _$LoginUserImpl;

  String get email;
  String get password;
  BuildContext get context;
  bool get enableNavigation;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginUserImplCopyWith<_$LoginUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtherLoginsImplCopyWith<$Res> {
  factory _$$OtherLoginsImplCopyWith(
          _$OtherLoginsImpl value, $Res Function(_$OtherLoginsImpl) then) =
      __$$OtherLoginsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, BuildContext context});
}

/// @nodoc
class __$$OtherLoginsImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$OtherLoginsImpl>
    implements _$$OtherLoginsImplCopyWith<$Res> {
  __$$OtherLoginsImplCopyWithImpl(
      _$OtherLoginsImpl _value, $Res Function(_$OtherLoginsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? context = null,
  }) {
    return _then(_$OtherLoginsImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$OtherLoginsImpl implements _OtherLogins {
  const _$OtherLoginsImpl({required this.email, required this.context});

  @override
  final String email;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AuthenticationEvent.otherLogins(email: $email, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherLoginsImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, context);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherLoginsImplCopyWith<_$OtherLoginsImpl> get copyWith =>
      __$$OtherLoginsImplCopyWithImpl<_$OtherLoginsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password,
            BuildContext context, bool enableNavigation)
        loginUser,
    required TResult Function(String email, BuildContext context) otherLogins,
    required TResult Function(String email, BuildContext context)
        forgotPassword,
    required TResult Function(String email, String password, String name,
            String confirmPassword, BuildContext context, bool enableNavigation)
        registerUser,
    required TResult Function() getUserData,
    required TResult Function() logout,
  }) {
    return otherLogins(email, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult? Function(String email, BuildContext context)? otherLogins,
    TResult? Function(String email, BuildContext context)? forgotPassword,
    TResult? Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult? Function()? getUserData,
    TResult? Function()? logout,
  }) {
    return otherLogins?.call(email, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult Function(String email, BuildContext context)? otherLogins,
    TResult Function(String email, BuildContext context)? forgotPassword,
    TResult Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult Function()? getUserData,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (otherLogins != null) {
      return otherLogins(email, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_OtherLogins value) otherLogins,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_Logout value) logout,
  }) {
    return otherLogins(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_OtherLogins value)? otherLogins,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_Logout value)? logout,
  }) {
    return otherLogins?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_OtherLogins value)? otherLogins,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (otherLogins != null) {
      return otherLogins(this);
    }
    return orElse();
  }
}

abstract class _OtherLogins implements AuthenticationEvent {
  const factory _OtherLogins(
      {required final String email,
      required final BuildContext context}) = _$OtherLoginsImpl;

  String get email;
  BuildContext get context;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtherLoginsImplCopyWith<_$OtherLoginsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotPasswordImplCopyWith<$Res> {
  factory _$$ForgotPasswordImplCopyWith(_$ForgotPasswordImpl value,
          $Res Function(_$ForgotPasswordImpl) then) =
      __$$ForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, BuildContext context});
}

/// @nodoc
class __$$ForgotPasswordImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$ForgotPasswordImpl>
    implements _$$ForgotPasswordImplCopyWith<$Res> {
  __$$ForgotPasswordImplCopyWithImpl(
      _$ForgotPasswordImpl _value, $Res Function(_$ForgotPasswordImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? context = null,
  }) {
    return _then(_$ForgotPasswordImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordImpl implements _ForgotPassword {
  const _$ForgotPasswordImpl({required this.email, required this.context});

  @override
  final String email;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'AuthenticationEvent.forgotPassword(email: $email, context: $context)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, context);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      __$$ForgotPasswordImplCopyWithImpl<_$ForgotPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password,
            BuildContext context, bool enableNavigation)
        loginUser,
    required TResult Function(String email, BuildContext context) otherLogins,
    required TResult Function(String email, BuildContext context)
        forgotPassword,
    required TResult Function(String email, String password, String name,
            String confirmPassword, BuildContext context, bool enableNavigation)
        registerUser,
    required TResult Function() getUserData,
    required TResult Function() logout,
  }) {
    return forgotPassword(email, context);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult? Function(String email, BuildContext context)? otherLogins,
    TResult? Function(String email, BuildContext context)? forgotPassword,
    TResult? Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult? Function()? getUserData,
    TResult? Function()? logout,
  }) {
    return forgotPassword?.call(email, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult Function(String email, BuildContext context)? otherLogins,
    TResult Function(String email, BuildContext context)? forgotPassword,
    TResult Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult Function()? getUserData,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(email, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_OtherLogins value) otherLogins,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_Logout value) logout,
  }) {
    return forgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_OtherLogins value)? otherLogins,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_Logout value)? logout,
  }) {
    return forgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_OtherLogins value)? otherLogins,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (forgotPassword != null) {
      return forgotPassword(this);
    }
    return orElse();
  }
}

abstract class _ForgotPassword implements AuthenticationEvent {
  const factory _ForgotPassword(
      {required final String email,
      required final BuildContext context}) = _$ForgotPasswordImpl;

  String get email;
  BuildContext get context;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterUserImplCopyWith<$Res> {
  factory _$$RegisterUserImplCopyWith(
          _$RegisterUserImpl value, $Res Function(_$RegisterUserImpl) then) =
      __$$RegisterUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String email,
      String password,
      String name,
      String confirmPassword,
      BuildContext context,
      bool enableNavigation});
}

/// @nodoc
class __$$RegisterUserImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$RegisterUserImpl>
    implements _$$RegisterUserImplCopyWith<$Res> {
  __$$RegisterUserImplCopyWithImpl(
      _$RegisterUserImpl _value, $Res Function(_$RegisterUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? confirmPassword = null,
    Object? context = null,
    Object? enableNavigation = null,
  }) {
    return _then(_$RegisterUserImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      enableNavigation: null == enableNavigation
          ? _value.enableNavigation
          : enableNavigation // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RegisterUserImpl implements _RegisterUser {
  const _$RegisterUserImpl(
      {required this.email,
      required this.password,
      required this.name,
      required this.confirmPassword,
      required this.context,
      this.enableNavigation = true});

  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
  @override
  final String confirmPassword;
  @override
  final BuildContext context;
  @override
  @JsonKey()
  final bool enableNavigation;

  @override
  String toString() {
    return 'AuthenticationEvent.registerUser(email: $email, password: $password, name: $name, confirmPassword: $confirmPassword, context: $context, enableNavigation: $enableNavigation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.enableNavigation, enableNavigation) ||
                other.enableNavigation == enableNavigation));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, name,
      confirmPassword, context, enableNavigation);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserImplCopyWith<_$RegisterUserImpl> get copyWith =>
      __$$RegisterUserImplCopyWithImpl<_$RegisterUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password,
            BuildContext context, bool enableNavigation)
        loginUser,
    required TResult Function(String email, BuildContext context) otherLogins,
    required TResult Function(String email, BuildContext context)
        forgotPassword,
    required TResult Function(String email, String password, String name,
            String confirmPassword, BuildContext context, bool enableNavigation)
        registerUser,
    required TResult Function() getUserData,
    required TResult Function() logout,
  }) {
    return registerUser(
        email, password, name, confirmPassword, context, enableNavigation);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult? Function(String email, BuildContext context)? otherLogins,
    TResult? Function(String email, BuildContext context)? forgotPassword,
    TResult? Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult? Function()? getUserData,
    TResult? Function()? logout,
  }) {
    return registerUser?.call(
        email, password, name, confirmPassword, context, enableNavigation);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult Function(String email, BuildContext context)? otherLogins,
    TResult Function(String email, BuildContext context)? forgotPassword,
    TResult Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult Function()? getUserData,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (registerUser != null) {
      return registerUser(
          email, password, name, confirmPassword, context, enableNavigation);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_OtherLogins value) otherLogins,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_Logout value) logout,
  }) {
    return registerUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_OtherLogins value)? otherLogins,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_Logout value)? logout,
  }) {
    return registerUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_OtherLogins value)? otherLogins,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (registerUser != null) {
      return registerUser(this);
    }
    return orElse();
  }
}

abstract class _RegisterUser implements AuthenticationEvent {
  const factory _RegisterUser(
      {required final String email,
      required final String password,
      required final String name,
      required final String confirmPassword,
      required final BuildContext context,
      final bool enableNavigation}) = _$RegisterUserImpl;

  String get email;
  String get password;
  String get name;
  String get confirmPassword;
  BuildContext get context;
  bool get enableNavigation;

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterUserImplCopyWith<_$RegisterUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserDataImplCopyWith<$Res> {
  factory _$$GetUserDataImplCopyWith(
          _$GetUserDataImpl value, $Res Function(_$GetUserDataImpl) then) =
      __$$GetUserDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserDataImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$GetUserDataImpl>
    implements _$$GetUserDataImplCopyWith<$Res> {
  __$$GetUserDataImplCopyWithImpl(
      _$GetUserDataImpl _value, $Res Function(_$GetUserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetUserDataImpl implements _GetUserData {
  const _$GetUserDataImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.getUserData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password,
            BuildContext context, bool enableNavigation)
        loginUser,
    required TResult Function(String email, BuildContext context) otherLogins,
    required TResult Function(String email, BuildContext context)
        forgotPassword,
    required TResult Function(String email, String password, String name,
            String confirmPassword, BuildContext context, bool enableNavigation)
        registerUser,
    required TResult Function() getUserData,
    required TResult Function() logout,
  }) {
    return getUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult? Function(String email, BuildContext context)? otherLogins,
    TResult? Function(String email, BuildContext context)? forgotPassword,
    TResult? Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult? Function()? getUserData,
    TResult? Function()? logout,
  }) {
    return getUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult Function(String email, BuildContext context)? otherLogins,
    TResult Function(String email, BuildContext context)? forgotPassword,
    TResult Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult Function()? getUserData,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_OtherLogins value) otherLogins,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_Logout value) logout,
  }) {
    return getUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_OtherLogins value)? otherLogins,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_Logout value)? logout,
  }) {
    return getUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_OtherLogins value)? otherLogins,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData(this);
    }
    return orElse();
  }
}

abstract class _GetUserData implements AuthenticationEvent {
  const factory _GetUserData() = _$GetUserDataImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthenticationEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email, String password,
            BuildContext context, bool enableNavigation)
        loginUser,
    required TResult Function(String email, BuildContext context) otherLogins,
    required TResult Function(String email, BuildContext context)
        forgotPassword,
    required TResult Function(String email, String password, String name,
            String confirmPassword, BuildContext context, bool enableNavigation)
        registerUser,
    required TResult Function() getUserData,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult? Function(String email, BuildContext context)? otherLogins,
    TResult? Function(String email, BuildContext context)? forgotPassword,
    TResult? Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult? Function()? getUserData,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email, String password, BuildContext context,
            bool enableNavigation)?
        loginUser,
    TResult Function(String email, BuildContext context)? otherLogins,
    TResult Function(String email, BuildContext context)? forgotPassword,
    TResult Function(
            String email,
            String password,
            String name,
            String confirmPassword,
            BuildContext context,
            bool enableNavigation)?
        registerUser,
    TResult Function()? getUserData,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_OtherLogins value) otherLogins,
    required TResult Function(_ForgotPassword value) forgotPassword,
    required TResult Function(_RegisterUser value) registerUser,
    required TResult Function(_GetUserData value) getUserData,
    required TResult Function(_Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_OtherLogins value)? otherLogins,
    TResult? Function(_ForgotPassword value)? forgotPassword,
    TResult? Function(_RegisterUser value)? registerUser,
    TResult? Function(_GetUserData value)? getUserData,
    TResult? Function(_Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_OtherLogins value)? otherLogins,
    TResult Function(_ForgotPassword value)? forgotPassword,
    TResult Function(_RegisterUser value)? registerUser,
    TResult Function(_GetUserData value)? getUserData,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthenticationEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? otpError, String? emailError,
            String? phoneError, String? error)
        errors,
    required TResult Function(UserModel user) userData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult? Function(UserModel user)? userData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult Function(UserModel user)? userData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AuthError value) errors,
    required TResult Function(_UserData value) userData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AuthError value)? errors,
    TResult? Function(_UserData value)? userData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AuthError value)? errors,
    TResult Function(_UserData value)? userData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthenticationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? otpError, String? emailError,
            String? phoneError, String? error)
        errors,
    required TResult Function(UserModel user) userData,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult? Function(UserModel user)? userData,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult Function(UserModel user)? userData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AuthError value) errors,
    required TResult Function(_UserData value) userData,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AuthError value)? errors,
    TResult? Function(_UserData value)? userData,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AuthError value)? errors,
    TResult Function(_UserData value)? userData,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthenticationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthenticationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? otpError, String? emailError,
            String? phoneError, String? error)
        errors,
    required TResult Function(UserModel user) userData,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult? Function(UserModel user)? userData,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult Function(UserModel user)? userData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AuthError value) errors,
    required TResult Function(_UserData value) userData,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AuthError value)? errors,
    TResult? Function(_UserData value)? userData,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AuthError value)? errors,
    TResult Function(_UserData value)? userData,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements AuthenticationState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AuthErrorImplCopyWith<$Res> {
  factory _$$AuthErrorImplCopyWith(
          _$AuthErrorImpl value, $Res Function(_$AuthErrorImpl) then) =
      __$$AuthErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? otpError,
      String? emailError,
      String? phoneError,
      String? error});
}

/// @nodoc
class __$$AuthErrorImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$AuthErrorImpl>
    implements _$$AuthErrorImplCopyWith<$Res> {
  __$$AuthErrorImplCopyWithImpl(
      _$AuthErrorImpl _value, $Res Function(_$AuthErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otpError = freezed,
    Object? emailError = freezed,
    Object? phoneError = freezed,
    Object? error = freezed,
  }) {
    return _then(_$AuthErrorImpl(
      otpError: freezed == otpError
          ? _value.otpError
          : otpError // ignore: cast_nullable_to_non_nullable
              as String?,
      emailError: freezed == emailError
          ? _value.emailError
          : emailError // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneError: freezed == phoneError
          ? _value.phoneError
          : phoneError // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthErrorImpl implements AuthError {
  const _$AuthErrorImpl(
      {this.otpError, this.emailError, this.phoneError, this.error});

  @override
  final String? otpError;
  @override
  final String? emailError;
  @override
  final String? phoneError;
  @override
  final String? error;

  @override
  String toString() {
    return 'AuthenticationState.errors(otpError: $otpError, emailError: $emailError, phoneError: $phoneError, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthErrorImpl &&
            (identical(other.otpError, otpError) ||
                other.otpError == otpError) &&
            (identical(other.emailError, emailError) ||
                other.emailError == emailError) &&
            (identical(other.phoneError, phoneError) ||
                other.phoneError == phoneError) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, otpError, emailError, phoneError, error);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      __$$AuthErrorImplCopyWithImpl<_$AuthErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? otpError, String? emailError,
            String? phoneError, String? error)
        errors,
    required TResult Function(UserModel user) userData,
  }) {
    return errors(otpError, emailError, phoneError, error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult? Function(UserModel user)? userData,
  }) {
    return errors?.call(otpError, emailError, phoneError, error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult Function(UserModel user)? userData,
    required TResult orElse(),
  }) {
    if (errors != null) {
      return errors(otpError, emailError, phoneError, error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AuthError value) errors,
    required TResult Function(_UserData value) userData,
  }) {
    return errors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AuthError value)? errors,
    TResult? Function(_UserData value)? userData,
  }) {
    return errors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AuthError value)? errors,
    TResult Function(_UserData value)? userData,
    required TResult orElse(),
  }) {
    if (errors != null) {
      return errors(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthenticationState {
  const factory AuthError(
      {final String? otpError,
      final String? emailError,
      final String? phoneError,
      final String? error}) = _$AuthErrorImpl;

  String? get otpError;
  String? get emailError;
  String? get phoneError;
  String? get error;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthErrorImplCopyWith<_$AuthErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UserDataImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$UserDataImpl implements _UserData {
  const _$UserDataImpl({required this.user});

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthenticationState.userData(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? otpError, String? emailError,
            String? phoneError, String? error)
        errors,
    required TResult Function(UserModel user) userData,
  }) {
    return userData(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult? Function(UserModel user)? userData,
  }) {
    return userData?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? otpError, String? emailError, String? phoneError,
            String? error)?
        errors,
    TResult Function(UserModel user)? userData,
    required TResult orElse(),
  }) {
    if (userData != null) {
      return userData(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(AuthError value) errors,
    required TResult Function(_UserData value) userData,
  }) {
    return userData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(AuthError value)? errors,
    TResult? Function(_UserData value)? userData,
  }) {
    return userData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(AuthError value)? errors,
    TResult Function(_UserData value)? userData,
    required TResult orElse(),
  }) {
    if (userData != null) {
      return userData(this);
    }
    return orElse();
  }
}

abstract class _UserData implements AuthenticationState {
  const factory _UserData({required final UserModel user}) = _$UserDataImpl;

  UserModel get user;

  /// Create a copy of AuthenticationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
