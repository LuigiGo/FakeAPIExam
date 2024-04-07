class ServerError {
  int? statusCode;
  String? header;
  String? message;

  ServerError({
    this.header,
    this.message,
    this.statusCode,
  });
}
