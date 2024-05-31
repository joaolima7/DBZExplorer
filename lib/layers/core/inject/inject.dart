import 'package:dbz_app/layers/data/datasources/api/dbz_api/character/get_character_all_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/api/dbz_api/character/get_character_by_name_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/api/dbz_api/planets/get_planets_all_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/api/dbz_api/planets/get_planets_by_name_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_all_datasource.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_by_name_datasource.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_planets_all_datasource.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_planets_by_name_datasource.dart';
import 'package:dbz_app/layers/data/repositories/character/get_character_all_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/character/get_character_by_name_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/planets/get_planets_all_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/planets/get_planets_by_name_repository_imp.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_all_repository.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_by_name_repository.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planets_all_repository.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planets_by_name_repository.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_all_usecase/get_planets_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_all_usecase/get_planets_all_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_by_name_usecase/get_planets_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_by_name_usecase/get_planets_by_name_usecase_imp.dart';
import 'package:dbz_app/layers/presentation/controllers/character_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/planets_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/searching_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<GetCharacterAllDataSource>(
        () => GetCharacterAllApiDataSourceImp());

    getIt.registerLazySingleton<GetCharacterByNameDataSoruce>(
        () => GetCharacterByNameApiDataSourceImp());

    getIt.registerLazySingleton<GetPlanetsAllDataSource>(
        () => GetPlanetsAllApiDataSourceImp());

    getIt.registerLazySingleton<GetPlanetsByNameDataSource>(
        () => GetPlanetsByNameApiDataSourceImp());

    //repositories
    getIt.registerLazySingleton<GetCharacterAllRepository>(
        () => GetCharacterAllRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetCharacterByNameRepository>(
        () => GetCharacterByNameRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetPlanetsAllRepository>(
        () => GetPlanetsAllRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetPlanetsByNameRepository>(
        () => GetPlanetsByNameRepositoryImp(getIt()));

    //usecases
    getIt.registerLazySingleton<GetCharactersAllUseCase>(
        () => GetCharacterAllUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetCharactersByNameUseCase>(
        () => GetCharactersByNameUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetPlanetsAllUseCase>(
        () => GetPlanetsAllUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetPlanetsByNameUseCase>(
        () => GetPlanetsByNameUseCaseImp(getIt()));

    //controllers
    getIt.registerFactory<CharacterController>(() => CharacterController(
          getIt(),
          getIt(),
        ));

    getIt.registerFactory<PlanetsController>(() => PlanetsController(
          getIt(),
          getIt(),
        ));

    getIt.registerFactory<SearchingController>(() => SearchingController(
          getIt(),
          getIt(),
        ));
  }
}
