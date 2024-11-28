//EXCEPTIONS
class DatabaseException implements Exception {
  final Map<String, String> localizedMessage;
  DatabaseException(this.localizedMessage);
}

class InsertFailureException extends DatabaseException {
  InsertFailureException(super.localizedMessage);
}

class ItemNotFoundException extends DatabaseException {
  ItemNotFoundException(super.localizedMessage);
}
