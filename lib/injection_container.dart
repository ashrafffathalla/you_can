import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:you_can/provider/auth_cubit/auth_cubit.dart';
import 'package:you_can/provider/exams_cubit/exams_cubit.dart';
import 'package:you_can/provider/levelsCubit/levelsCubit.dart';
import 'package:you_can/provider/profile_cubit/profile_cubit.dart';
import 'package:you_can/repositories/auth_repositories/forget_pass_repositories.dart';
import 'package:you_can/repositories/auth_repositories/login_repositories.dart';
import 'package:you_can/repositories/auth_repositories/profileRepository.dart';
import 'package:you_can/repositories/auth_repositories/sign_up_repositories.dart';
import 'package:you_can/repositories/examsRepositories/exam_repositories.dart';
import 'package:you_can/repositories/levelsRepositories/levels_repostories.dart';
import 'core/constant/apis.dart';
import 'core/localization/language_cubit.dart';
import 'data/local/hiva_helper.dart';
import 'data/remote/dio_helper.dart';
final GetIt getIt = GetIt.instance;
Future<void> init() async {
// Cubit
  getIt.registerFactory(() => LanguageCubit(getIt()));
  // getIt.registerFactory(
  //     () => CheckCarCubit(uploadCarSideImageRepository: getIt()));
  getIt.registerFactory(() => AuthCubit(
      loginRepositories: getIt(),
      signUpRepositories: getIt(),
      forgetPassRepositories: getIt())
  );
  getIt.registerFactory(() => ProfileCubit(getProfileRepository: getIt())


  );
  getIt.registerFactory(() => AllLevelsCubit(
    repositories: getIt(),
  )
  );
  //------------------------
  getIt.registerFactory(() => ExamsCubit(
    repositories: getIt(),
  )
  );
  //---------------------------------

  ///------------------------------------
  getIt.registerLazySingleton(
      () => LoginRepositories(dioHelper: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(
          () => LevelsRepositories(dioHelper: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(
      () => SignUpRepositories(dioHelper: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(
      () => ForgetPassRepositories(dioHelper: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(() => GetProfileRepository(dioHelper: getIt()));
  getIt.registerLazySingleton(
          () => ExamsRepositories(dioHelper: getIt(), hiveHelper: getIt()));
  // getIt.registerLazySingleton(() => DeleteAccountRepositories());
  // getIt.registerLazySingleton(() => UpdateName(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => UpdateEmail(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => UpdatePhone(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => UpdatePassword(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => UpdateAllFields(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => SearchRepositories(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => AddCardRepository(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => GetCarsRepositories(dioHelper: getIt()));
  // getIt.registerLazySingleton(
  //     () => GetCarsDetailsRepositories(dioHelper: getIt()));
  // getIt
  //     .registerLazySingleton(() => GetCreditCardRepository(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => GetOrdersReopsitory(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => GetCarsChangeListRepositories(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => QRRepository(dioHelper: getIt()));
  // getIt.registerLazySingleton(
  //     () => GetOrderDataRepositories(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => AddOrderRepositories(getIt()));
  // getIt.registerLazySingleton(() => UploadCarSideImageRepositories(getIt()));
  // getIt.registerLazySingleton(() => OpenCarRepositories(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => ContractRepository(dioHelper: getIt()));
  // getIt.registerLazySingleton(() => CheckOutRepositories(dioHelper: getIt()));
  //
  // Data sources
  getIt.registerLazySingleton(() => HiveHelper());

  // External

  getIt.registerLazySingleton(
      () => DioHelper(dio: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: AutomationApi.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    ),
  );
}
