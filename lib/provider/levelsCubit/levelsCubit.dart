import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_can/provider/levelsCubit/levelsStates.dart';

import '../../data/model/LevelsModel.dart';
import '../../repositories/levelsRepositories/levels_repostories.dart';

class AllLevelsCubit extends Cubit<AllLevelsState> {
  AllLevelsCubit({required this.repositories}) : super(GetAllLevelsInitial());
  static AllLevelsCubit get(context) => BlocProvider.of(context);
  final LevelsRepositories repositories;

  ///----------Get All Orders -----------------
  LevelsModel? levelsModel;
  getAllLevels() async {
    emit(GetAllLevelsLoading());
    try {
      levelsModel = await repositories.allLevelsRepositories();
      emit(GetAllLevelsLoaded());
    } catch (e) {
      emit(GetAllLevelsError(error: e.toString()));
    }
  }

}