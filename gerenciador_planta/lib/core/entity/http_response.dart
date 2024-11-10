

final class HttpResponse<T> {
  const HttpResponse({
    this.data,
    this.statusCode,
  });

  final T? data;
  final int? statusCode;
}