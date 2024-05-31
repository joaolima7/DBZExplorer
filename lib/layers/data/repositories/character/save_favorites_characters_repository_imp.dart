import 'package:dbz_app/layers/data/datasources/character_datasource/save_favorites_characters_datasource.dart';
import 'package:dbz_app/layers/domain/repositories/character/save_favorites_characters_repository.dart';

class SaveFavoritesCharactersRepositoryImp
    implements SaveFavoritesCharactersRepository {
  SaveFavoritesCharactersDataSource _saveFavoritesCharactersDataSource;
  SaveFavoritesCharactersRepositoryImp(this._saveFavoritesCharactersDataSource);

  @override
  Future<void> call() async {
    _saveFavoritesCharactersDataSource;
  }
}
