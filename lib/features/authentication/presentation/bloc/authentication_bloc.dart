
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibuild_vendor/core/utils/app_utils/app_logger.dart';
import 'package:ibuild_vendor/features/authentication/data/model/user/user_model.dart';
import 'package:ibuild_vendor/features/authentication/domain/repositories/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthRepository authRepository;
  AuthenticationBloc({required this.authRepository}) : super(const _Initial()) {
    on<AuthenticationEvent>((event, emit) async {
      await event.when(
        started: () {},
        getUserData: () async {
          try {
            final result = await authRepository.getUserProfile();
            result.fold((error) {}, (userData) {
              emit(AuthenticationState.userData(user: userData));
            });
          } catch (e, stackTrace) {
            AppLogger.logError(e);
            AppLogger.logError(stackTrace);
          }
        },
        logout: () async {
          try {
            final result = await authRepository.logout();
            if (result) {}
          } catch (e, stackTrace) {
            AppLogger.logError(e);
            AppLogger.logError(stackTrace);
          }
        },
        loginUser: (
          String email,
          String password,
          BuildContext context,
          bool enableNavigation,
        ) async {
          try {
            final result = await authRepository.loginUser(
              email: email,
              password: password,
            );
            result.fold((error) {}, (success) {
              if (success ?? false) {}
            });
          } catch (e, stackTrace) {
            AppLogger.logError(e);
            AppLogger.logError(stackTrace);
          }
        },
        otherLogins: (
          String email,
          BuildContext context,
        ) async {
          try {
            final result = await authRepository.otherLogins(
              email: email,
            );
            result.fold((error) {}, (success) {
              if (success ?? false) {}
            });
          } catch (e, stackTrace) {
            AppLogger.logError(e);
            AppLogger.logError(stackTrace);
          }
        },
        forgotPassword: (
          String email,
          BuildContext context,
        ) async {
          try {
            final result = await authRepository.forgotPassword(
              email: email,
            );
            result.fold((error) {}, (success) {
              if (success ?? false) {}
            });
          } catch (e, stackTrace) {
            AppLogger.logError(e);
            AppLogger.logError(stackTrace);
          }
        },
        registerUser: (
          String email,
          String password,
          String name,
          String confirmPassword,
          BuildContext context,
          bool enableNavigation,
        ) async {
          try {
            var result = await authRepository.registerUser(
              email: email,
              password: password,
              name: name,
              confirmPassword: confirmPassword,
            );
            result?.fold(
              (error) {},
              (success) {},
            );
          } catch (e, stack) {
            AppLogger.logInfo(e);
            AppLogger.logInfo(stack);
          }
        },
      );
    });
  }

}
