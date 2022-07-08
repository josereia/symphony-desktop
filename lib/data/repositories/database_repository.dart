import 'package:symphony_desktop/data/models/song_model.dart';
import 'package:symphony_desktop/data/providers/database_provider.dart';

class DatabaseRepository {
  final DatabaseProvider provider;

  DatabaseRepository(this.provider);

  Future<List<SongModel>> getSongs() async {
    return await provider.getSongs();
  }

  /*
  Future<void> init() async {
    await database.init();
  }
  Future<void> close() async {
    await database.close();
  }
  Future<void> insert(T entity) async {
    await database.insert(entity);
  }
  Future<void> update(T entity) async {
    await database.update(entity);
  }
  Future<void> delete(T entity) async {
    await database.delete(entity);
  }
  Future<T> get(T entity) async {
    return await database.get(entity);
  }
  Future<List<T>> getAll(T entity) async {
    return await database.getAll(entity);
  }
  Future<List<T>> getAllBy(T entity, String field, dynamic value) async {
    return await database.getAllBy(entity, field, value);
  }
  Future<List<T>> getAllByOrderBy(T entity, String field, dynamic value, String orderBy) async {
    return await database.getAllByOrderBy(entity, field, value, orderBy);
  }
  Future<List<T>> getAllByOrderByDesc(T entity, String field, dynamic value, String orderBy) async {
    return await database.getAllByOrderByDesc(entity, field, value, orderBy);
  }
  Future<List<T>> getAllByOrderByDescLimit(T entity, String field, dynamic value, String orderBy, int limit) async {
    return await database.getAllByOrderByDescLimit(entity, field, value, orderBy, limit);
  }
  Future<List<T>> getAllByOrderByLimit(T entity, String field, dynamic value, String orderBy, int limit) async {
    return await database.getAllByOrderByLimit(entity, field, value, orderBy, limit);
  }
  Future<List<T>> getAllByLimit(T entity, String field, dynamic value, int limit) async {
    return await database.getAllByLimit(entity, field

    */
}
