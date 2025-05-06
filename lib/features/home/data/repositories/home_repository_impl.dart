import 'package:dartz/dartz.dart';
import 'package:ibuild_vendor/features/home/data/datasources/homeremotedatasources.dart';
import 'package:ibuild_vendor/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDatasources homeRemoteDatasources;

  HomeRepositoryImpl({required this.homeRemoteDatasources});
  
  @override
  Future<Either<String,dynamic>> getHomeData() async {
    return await homeRemoteDatasources.getHomeData();
  }
}
