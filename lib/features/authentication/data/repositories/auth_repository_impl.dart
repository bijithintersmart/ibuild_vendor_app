import 'package:dartz/dartz.dart';
import 'package:ibuild_vendor/features/authentication/data/datasource/remotedatascource.dart';
import 'package:ibuild_vendor/features/authentication/data/model/user/user_model.dart';
import 'package:ibuild_vendor/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRemoteDatasource authRemoteDatasource;
  AuthRepositoryImpl({required this.authRemoteDatasource});

  @override
  Future<bool> logout() async {
    return await authRemoteDatasource.logout();
  }

  @override
  Future<Either<String, UserModel>> getUserProfile() async {
    return await authRemoteDatasource.getUserProfile();
  }

  @override
  Future<Either<String, bool?>> loginUser(
      {required String email, required String password}) async {
    return await authRemoteDatasource.loginUser(
        email: email, password: password);
  }

  @override
  Future<Either<String, bool?>> otherLogins({required String email}) async {
    return await authRemoteDatasource.otherLogins(email: email);
  }

  @override
  Future<Either<String, bool?>> forgotPassword({required String email}) async {
    return await authRemoteDatasource.forgotPassword(email: email);
  }

  @override
  Future<Either<String, bool>?> registerUser(
      {required String email,
      required String password,
      required String name,
      required String confirmPassword}) async {
    return await authRemoteDatasource.registerUser(
        email: email,
        password: password,
        name: name,
        confirmPassword: confirmPassword);
  }
}
