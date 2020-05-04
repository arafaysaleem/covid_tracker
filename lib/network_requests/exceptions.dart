class AppException implements Exception {
  final _message;
  
AppException([this._message,]);
  
String toString() {
    return "$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message]) : super(message);
}