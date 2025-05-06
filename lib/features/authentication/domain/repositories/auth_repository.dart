import 'package:dartz/dartz.dart';
import 'package:ibuild_vendor/features/authentication/data/model/user/user_model.dart';

abstract class AuthRepository {
  Future<Either<String, bool?>> loginUser({
    required String email,
    required String password,
  });
  Future<Either<String, bool>?> registerUser({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
  });
  Future<Either<String, bool?>> otherLogins({
    required String email,
  });
  Future<Either<String, bool?>> forgotPassword({
    required String email,
  });
  Future<Either<String, UserModel>> getUserProfile();
  Future<bool> logout();
}
