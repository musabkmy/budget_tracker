import 'package:budget_tracker/core/exceptions/db_exceptions.dart';

abstract class DataState<T> {
  final T? data;
  final String? errorKey;
  final ExceptionItemType? itemType;

  DataState(this.data, this.errorKey, {this.itemType});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data, null);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(String errorKey, ExceptionItemType itemType)
      : super(null, errorKey, itemType: itemType);

  factory DataFailed.unknown() {
    return DataFailed('UnknownException', ExceptionItemType.item);
  }
}
