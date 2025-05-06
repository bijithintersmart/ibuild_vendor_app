import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibuild_vendor/features/home/domain/repositories/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;
  HomeBloc({required this.repository}) : super(const _Initial()) {
    on<HomeEvent>((event, emit) async {
      await event.when(getHomeData: () async {
        var result =await repository.getHomeData();
        result.fold((error){}, (success){
          emit(const HomeState.homeData());
        });
      });
    });
  }
}
