import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibuild_vendor/core/constant/api_config.dart';
import 'package:ibuild_vendor/core/utils/app_utils/api_client.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';
import 'package:ibuild_vendor/core/utils/local_storage/global_local_storage.dart';
import 'package:ibuild_vendor/features/authentication/data/model/user/user_model.dart';

class AuthRemoteDatasource {
  final ApiClient client;
  AuthRemoteDatasource({required this.client});
  final GlobalLocalStorage localStorage = GlobalLocalStorage();

  // Initializes the local storage
  Future<void> _initLocalStorage() async {
    await localStorage.init();
  }

  // Stores data in local storage
  Future<void> storeToLocal(String key, String value) async {
    await _initLocalStorage();
    await localStorage.setString(key, value);
  }

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      var response = await client.get(ApiEndPoints.getProfile);
      if (response.statusCode == 200) {
        return Right(UserModel.fromJson(response.data));
      } else {
        return const Left('Error fetching user details');
      }
    } on DioException catch (error) {
      return Left(getMessageFromResCode(error.response?.statusCode ?? 500));
    }
  }

  Future<bool> logout() async {
    bool logoutStatus = false;
    if (await localStorage.clearData()) {
      logoutStatus = true;
    }
    return logoutStatus;
  }

  Future<Either<String, bool?>> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      var response = await client.post(ApiEndPoints.login,
          data: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } on DioException catch (error) {
      return Left(getMessageFromResCode(error.response?.statusCode ?? 500));
    }
  }

  Future<Either<String, bool?>> otherLogins({required String email}) async {
    try {
      var response = await client.post(ApiEndPoints.otherLogin, data: {
        'email': email,
      });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } on DioException catch (error) {
      return Left(getMessageFromResCode(error.response?.statusCode ?? 500));
    }
  }

  Future<Either<String, bool?>> forgotPassword({required String email}) async {
    try {
      var response = await client.post(ApiEndPoints.forgotPassword, data: {
        'email': email,
      });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } on DioException catch (error) {
      return Left(getMessageFromResCode(error.response?.statusCode ?? 500));
    }
  }

  Future<Either<String, bool>?> registerUser(
      {required String email,
      required String password,
      required String name,
      required String confirmPassword}) async {
    try {
      var response = await client.post(ApiEndPoints.register, data: {
        'email': email,
        'password': password,
        'name': name,
        'confirmPassword': confirmPassword,
      });
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } on DioException catch (error) {
      return Left(getMessageFromResCode(error.response?.statusCode ?? 500));
    }
  }
}
