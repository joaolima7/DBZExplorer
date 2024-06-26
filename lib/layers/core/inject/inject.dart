import 'package:dbz_app/layers/data/datasources/api/dbz_api/character/get_character_all_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/api/dbz_api/character/get_character_by_name_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/api/dbz_api/planets/get_planets_all_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/api/dbz_api/planets/get_planets_by_name_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/api/dbz_api/transformations/get_transformations_all_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/api/dbz_api/transformations/get_transformations_by_name_api_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/delete_favorite_character_datasource.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_all_characters_saveds_datasource.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_all_datasource.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_by_name_datasource.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/get_character_saved_by_name_datasource.dart';
import 'package:dbz_app/layers/data/datasources/character_datasource/save_favorites_characters_datasource.dart';
import 'package:dbz_app/layers/data/datasources/local/character/delete_favorite_character_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/character/get_character_all_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/character/get_character_saved_by_name_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/character/save_favorites_characters_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/planet/delete_favorite_planet_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/planet/get_all_planets_saved_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/planet/get_planet_saved_by_name_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/planet/save_favorites_planets_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/transformation/delete_favorite_transformation_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/transformation/get_all_transformations_saveds_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/transformation/get_transformations_saveds_by_name_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/local/transformation/save_favorites_transformations_local_datasource_imp.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/delete_favorite_planet_datasource.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_all_planets_saved_datasource.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_planet_saved_by_name_datasource.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_planets_all_datasource.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/get_planets_by_name_datasource.dart';
import 'package:dbz_app/layers/data/datasources/planets_datasource/save_favorites_planets_datasource.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/delete_favorite_transformation_datasource.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_all_transformations_saveds_datasource.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_all_datasource.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_by_name_datasource.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/get_transformations_saveds_by_name_datasource.dart';
import 'package:dbz_app/layers/data/datasources/transformations_datasource/save_favorites_transformations_datasource.dart';
import 'package:dbz_app/layers/data/repositories/character/delete_favorite_character_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/character/get_all_characters_saveds_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/character/get_character_all_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/character/get_character_by_name_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/character/get_character_saved_by_name_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/character/save_favorites_characters_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/planets/delete_favorite_planet_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/planets/get_all_planets_saved_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/planets/get_planet_saved_by_name_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/planets/get_planets_all_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/planets/get_planets_by_name_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/planets/save_favorites_planets_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/transformations/delete_favorite_transformation_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/transformations/get_all_transformations_saveds_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/transformations/get_transformations_all_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/transformations/get_transformations_by_name_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/transformations/get_transformations_saveds_by_name_repository_imp.dart';
import 'package:dbz_app/layers/data/repositories/transformations/save_favorites_transformations_repository_imp.dart';
import 'package:dbz_app/layers/domain/repositories/character/delete_favorite_character_repository.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_all_characters_saveds_repository.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_all_repository.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_by_name_repository.dart';
import 'package:dbz_app/layers/domain/repositories/character/get_character_saved_by_name_repository.dart';
import 'package:dbz_app/layers/domain/repositories/character/save_favorites_characters_repository.dart';
import 'package:dbz_app/layers/domain/repositories/planets/delete_favorite_planet_repository.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_all_planets_saved_repository.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planet_saved_by_name_repository.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planets_all_repository.dart';
import 'package:dbz_app/layers/domain/repositories/planets/get_planets_by_name_repository.dart';
import 'package:dbz_app/layers/domain/repositories/planets/save_favorites_planets_repository.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/delete_favorite_transformation_repository.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_all_transformations_saveds_repository.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_all_repository.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_by_name_repository.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/get_transformations_saveds_by_name_repository.dart';
import 'package:dbz_app/layers/domain/repositories/transformations/save_favorites_transformations_repository.dart';
import 'package:dbz_app/layers/domain/usecases/character/delete_favorite_character_usecase/delete_favorite_character_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/delete_favorite_character_usecase/delete_favorite_character_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_all_characters_saveds_usecase/get_all_characters_saveds_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_all_characters_saveds_usecase/get_all_characters_saveds_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_character_saved_by_name_usecase/get_character_saved_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_character_saved_by_name_usecase/get_character_saved_by_name_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_all_usecase/get_characters_all_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/get_characters_by_name_usecase/get_characters_by_name_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/character/save_favorites_characters_usecase/save_favorites_characters_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/character/save_favorites_characters_usecase/save_favorites_characters_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/planets/delete_favorite_planet_usecase/delete_favorite_planet_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/delete_favorite_planet_usecase/delete_favorite_planet_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_all_planets_saved_usecase/get_all_planets_saved_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_all_planets_saved_usecase/get_all_planets_saved_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planet_saved_by_name_usecase/get_planet_saved_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planet_saved_by_name_usecase/get_planet_saved_by_name_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_all_usecase/get_planets_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_all_usecase/get_planets_all_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_by_name_usecase/get_planets_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/get_planets_by_name_usecase/get_planets_by_name_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/planets/save_favorites_planets_usecase/save_favorites_planets_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/planets/save_favorites_planets_usecase/save_favorites_planets_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/delete_favorite_transformation_usecase/delete_favorite_transformation_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/delete_favorite_transformation_usecase/delete_favorite_transformation_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_all_transformations_saveds_usecase/get_all_transformations_saveds_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_all_transformations_saveds_usecase/get_all_transformations_saveds_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformation_saved_by_name_usecase/get_transformation_saved_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformation_saved_by_name_usecase/get_transformation_saved_by_name_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_all_usecase/get_transformations_all_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_all_usecase/get_transformations_all_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_by_name_usecase/get_transformations_by_name_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/get_transformations_by_name_usecase/get_transformations_by_name_usecase_imp.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/save_favorites_transformations_usecase/save_favorites_transformations_usecase.dart';
import 'package:dbz_app/layers/domain/usecases/transformations/save_favorites_transformations_usecase/save_favorites_transformations_usecase_imp.dart';
import 'package:dbz_app/layers/presentation/controllers/characters/character_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/characters/character_dao_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/planets/planet_dao_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/planets/planets_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/searching_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/transformations/transformations_controller.dart';
import 'package:dbz_app/layers/presentation/controllers/transformations/transformations_dao_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<GetCharacterAllDataSource>(
        () => GetCharacterAllApiDataSourceImp());

    getIt.registerLazySingleton<GetAllCharactersSavedsDataSource>(
        () => GetAllLocalCharactersSavedsDataSource());

    getIt.registerLazySingleton<GetCharacterByNameDataSoruce>(
        () => GetCharacterByNameApiDataSourceImp());

    getIt.registerLazySingleton<GetCharacterSavedByNameDataSource>(
        () => GetCharacterSavedByNameLocalDataSourceImp());

    getIt.registerLazySingleton<GetTransformationsAllDataSource>(
        () => GetTransformationsAllApiDataSourceImp());

    getIt.registerLazySingleton<GetTransformationsByNameDataSource>(
        () => GetTransformationsByNameApiDataSourceImp());

    getIt.registerLazySingleton<DeleteFavoriteTransformationDataSource>(
        () => DeleteFavoriteTransformationLocalDataSourceImp());

    getIt.registerLazySingleton<GetAllTransformationsSavedsDataSource>(
        () => GetAllTransformationsSavedsLocalDataSourceImp());

    getIt.registerLazySingleton<GetTransformationsSavedsByNameDataSource>(
        () => GetTransformationsSavedsByNameLocalDataSourceImp());

    getIt.registerLazySingleton<SaveFavoritesTransformationsDataSource>(
        () => SaveFavoritesTransformationsLocalDataSourceImp());

    getIt.registerLazySingleton<DeleteFavoriteCharacterDataSource>(
        () => DeleteFavoriteCharacterLocalDataSourceImp());

    getIt.registerLazySingleton<SaveFavoritesCharactersDataSource>(
        () => SaveFavoritesCharactersLocalDataSourceImp());

    getIt.registerLazySingleton<GetPlanetsAllDataSource>(
        () => GetPlanetsAllApiDataSourceImp());

    getIt.registerLazySingleton<GetPlanetsByNameDataSource>(
        () => GetPlanetsByNameApiDataSourceImp());

    getIt.registerLazySingleton<DeleteFavoritePlanetDataSource>(
        () => DeleteFavoritePlanetLocalDataSourceImp());

    getIt.registerLazySingleton<GetAllPlanetsSavedDataSource>(
        () => GetAllPlanetsSavedLocalDataSourceImp());

    getIt.registerLazySingleton<GetPlanetSavedByNameDataSource>(
        () => GetPlanetSavedByNameLocalDataSourceImp());

    getIt.registerLazySingleton<SaveFavoritesPlanetsDataSource>(
        () => SaveFavoritesPlanetsLocalDataSourceImp());

    //repositories
    getIt.registerLazySingleton<GetCharacterAllRepository>(
        () => GetCharacterAllRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetCharacterByNameRepository>(
        () => GetCharacterByNameRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetAllCharactersSavedsRepository>(
        () => GetAllCharactersSavedsRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetCharacterSavedByNameRepository>(
        () => GetCharacterSavedByNameRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetTransformationsAllRepository>(
        () => GetTransformationsAllRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetTransformationsByNameRepository>(
        () => GetTransformationsByNameRepositoryImp(getIt()));

    getIt.registerLazySingleton<DeleteFavoriteTransformationRepository>(
        () => DeleteFavoriteTransformationRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetAllTransformationsSavedsRepository>(
        () => GetAllTransformationsSavedsRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetTransformationsSavedsByNameRepository>(
        () => GetTransformationsSavedsByNameRepositoryImp(getIt()));

    getIt.registerLazySingleton<SaveFavoritesTransformationsRepository>(
        () => SaveFavoritesTransformationsRepositoryImp(getIt()));

    getIt.registerLazySingleton<DeleteFavoriteCharacterRepository>(
        () => DeleteFavoriteCharacterRepositoryImp(getIt()));

    getIt.registerLazySingleton<SaveFavoritesCharactersRepository>(
        () => SaveFavoritesCharactersRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetPlanetsAllRepository>(
        () => GetPlanetsAllRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetPlanetsByNameRepository>(
        () => GetPlanetsByNameRepositoryImp(getIt()));

    getIt.registerLazySingleton<DeleteFavoritePlanetRepository>(
        () => DeleteFavoritePlanetRepositoryImp(getIt()));

    getIt.registerLazySingleton<GetAllPlanetsSavedRepository>(
        () => GetAllPlanetsSavedRespositoryImp(getIt()));

    getIt.registerLazySingleton<GetPlanetSavedByNameRepository>(
        () => GetPlanetSavedByNameRepositoryImp(getIt()));

    getIt.registerLazySingleton<SaveFavoritesPlanetsRepository>(
        () => SaveFavoritesPlanetsRepositoryImp(getIt()));

    //usecases
    getIt.registerLazySingleton<GetCharactersAllUseCase>(
        () => GetCharacterAllUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetCharactersByNameUseCase>(
        () => GetCharactersByNameUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetAllCharactersSavedsUseCase>(
        () => GetAllCharactersSavedsUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetCharacterSavedByNameUseCase>(
        () => GetCharacterSavedByNameUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetTransformationsAllUseCase>(
        () => GetTranformationsAllUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetTransformationsByNameUseCase>(
        () => GetTransformationsByNameUseCaseImp(getIt()));

    getIt.registerLazySingleton<DeleteFavoriteTransformationUseCase>(
        () => DeleteFavoriteTransformationUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetAllTransformationsSavedsUseCase>(
        () => GetAllTransformationsSavedsUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetTransformationsSavedByNameUseCase>(
        () => GetTransformationsSavedByNameUseCaseImp(getIt()));

    getIt.registerLazySingleton<SaveFavoritesTransformationsUseCase>(
        () => SaveFavoritesTransformationsUseCaseImp(getIt()));

    getIt.registerLazySingleton<DeleteFavoriteCharacterUseCase>(
        () => DeleteFavoriteCharacterUseCaseImp(getIt()));

    getIt.registerLazySingleton<SaveFavoritesCharactersUseCase>(
        () => SaveFavoritesCharactersUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetPlanetsAllUseCase>(
        () => GetPlanetsAllUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetPlanetsByNameUseCase>(
        () => GetPlanetsByNameUseCaseImp(getIt()));

    getIt.registerLazySingleton<DeleteFavoritePlanetUseCase>(
        () => DeleteFavoritePlanetUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetAllPlanetsSavedUseCase>(
        () => GetAllPlanetsSavedUseCaseImp(getIt()));

    getIt.registerLazySingleton<GetPlanetSavedByNameUseCase>(
        () => GetPlanetSavedByNameUseCaseImp(getIt()));

    getIt.registerLazySingleton<SaveFavoritesPlanetsUsecase>(
        () => SaveFavoritesPlanetsUseCaseImp(getIt()));

    //controllers
    getIt.registerFactory<CharacterController>(() => CharacterController(
          getIt(),
          getIt(),
        ));

    getIt.registerFactory<PlanetsController>(() => PlanetsController(
          getIt(),
          getIt(),
        ));

    getIt.registerFactory<TransformationsController>(
        () => TransformationsController(
              getIt(),
              getIt(),
            ));

    getIt.registerFactory<SearchingController>(() => SearchingController(
          getIt(),
          getIt(),
          getIt(),
        ));

    getIt.registerFactory<CharacterDaoController>(() => CharacterDaoController(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ));

    getIt.registerFactory<PlanetDaoController>(() => PlanetDaoController(
          getIt(),
          getIt(),
          getIt(),
          getIt(),
        ));

    getIt.registerFactory<TransformationsDaoController>(
        () => TransformationsDaoController(
              getIt(),
              getIt(),
              getIt(),
              getIt(),
            ));
  }
}
