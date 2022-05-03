class NetworkException implements Exception {
  final String? message;

  const NetworkException({this.message});

  @override
  String toString() => "$message";


}

class ClientError extends NetworkException {

  ClientError(String? message):
        super(message: message);

}

class ServerError extends NetworkException {

  ServerError(String? message):
        super(message: message);
}

/// Failure model class
class NetworkFailure {
  String? message;
  int code;

  NetworkFailure(this.message, this.code);

  @override
  String toString() => "Status Code: $code, Message: $message";

}