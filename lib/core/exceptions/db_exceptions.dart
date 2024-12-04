///used for personalized message depending on the item type
enum ExceptionItemType { item, budget }

//EXCEPTIONS
class UnknownException implements Exception {
  UnknownException();
}

class DatabaseException implements Exception {
  DatabaseException();
}

class InsertFailureException extends DatabaseException {
  InsertFailureException();
}

class ItemNotFoundException extends DatabaseException {
  ItemNotFoundException();
}

class UpdateItemException extends DatabaseException {
  UpdateItemException();
}
