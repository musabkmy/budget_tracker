/// Generalize InterFace For DataBase Repository Implementation
abstract class InterfaceRepository<T> {
  /// Get All Data From DB
  Future<Iterable<T>> getAll();

  /// Remove All Data From DB
  Future<void> removeAll();

  /// Get Item From DB
  Future<T?> getItem({required String key});

  /// Insert Item To DB
  Future<bool> insertItem({required String key, required T item});

  /// Update Item in DB
  Future<bool> updateItem({required String key, required T item});

  /// Remove Item in DB
  Future<bool> removeItem({required String key, required T item});

  /// is Data Available
  Future<bool> isDataAvailable();
}
