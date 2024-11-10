

import 'dart:convert';

import 'package:gerenciador_planta/core/entity/http_response.dart';
import 'package:http/http.dart' as http;

abstract interface class IHttpClient {
  Future<HttpResponse> get(String uri);
  Future<HttpResponse> post(String uri, {dynamic data});
  Future<HttpResponse> put(String uri, {dynamic data});
  Future<HttpResponse> patch(String uri, {dynamic data});
  Future<HttpResponse> delete(String uri, {dynamic data});
}

final class HttpClient implements IHttpClient {
  final http.Client client;
  HttpClient(this.client);

  @override
  Future<HttpResponse> get(String uri) async {
    try {
      final http.Response response = await client.get(Uri.parse(uri));
      return _createHttpResponseFromResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> patch(String uri, {dynamic data}) async {
    try {
      final http.Response response = await client.patch(Uri.parse(uri), body: data);
      return _createHttpResponseFromResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> post(String uri, {dynamic data}) async {
    try {
      final http.Response response = await client.post(Uri.parse(uri), body: data);
      return _createHttpResponseFromResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> put(String uri, {dynamic data}) async {
    try {
      final http.Response response = await client.put(Uri.parse(uri), body: data);
      return _createHttpResponseFromResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<HttpResponse> delete(String uri, {dynamic data}) async {
    try {
      final http.Response response = await client.delete(Uri.parse(uri), body: data);
      return _createHttpResponseFromResponse(response);
    } catch (_) {
      rethrow;
    }
  }

  HttpResponse _createHttpResponseFromResponse(http.Response response) {
    return HttpResponse(
      data: jsonDecode(response.body),
      statusCode: response.statusCode,
    );
  }
}