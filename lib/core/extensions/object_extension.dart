extension ObjectExtension<T> on T? {
  R? let<R>(R Function(T) operation) {
    if (this == null) {
      return null;
    }
    return operation(this as T);
  }
}
