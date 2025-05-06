import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ibuild_vendor/core/constant/api_config.dart';
import 'package:ibuild_vendor/core/utils/app_utils/api_client.dart';
import 'package:ibuild_vendor/core/utils/app_utils/functions.dart';

class HomeRemoteDatasources {
  final ApiClient client;
  HomeRemoteDatasources({required this.client});

  Future<Either<String,dynamic>> getHomeData() async {
    try {
      var response = await client.get(ApiEndPoints.home);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return Left(response.data['message'] ?? 'Error fetching home details');
      }
    } on DioException catch (error) {
      return Left(getMessageFromResCode(error.response?.statusCode ?? 500));
    }
  }
}
