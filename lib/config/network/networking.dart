import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_technical/config/multilanguage/language_value.dart';
import 'package:project_technical/config/session/app_sesion.dart';
import 'package:project_technical/domain/model/api_response.dart';

import '../../config.dart';
import '../route/app_route.gr.dart';

enum MethodType { get, post, put, delete, patch }

class ApiConstant {
  static final ApiConstant _instance = ApiConstant.internal();

  ApiConstant.internal();

  factory ApiConstant() => _instance;

  static String baseUrl = ConfigEnvironments.getEnvironments().url;
  static String baseUrlImage = ConfigEnvironments.getEnvironments().urlMedia;

  final dio = createDio();
  final rawDio = createRawDio();

  // Dio
  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 90),
      connectTimeout: const Duration(seconds: 90),
      // sendTimeout: const Duration(seconds: 90),
    ));

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ));
    }

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (option, handler) async {
        option.headers.addAll({"Content-Type": "application/json"});
        option.headers.addAll({"Accept": "application/json"});

        if (!option.headers.containsKey("computeAPI")) {
          option.headers.addAll({
            "accept-language": AppSession().getLanguage(),
          });
        } else {
          option.headers.remove("computeAPI");
        }

        if (option.headers.containsKey("optionalToken")) {
          option.headers.remove("optionalToken");

          //add the token to the header
          final String token = await AppSession().getToken();
          if (token.isNotEmpty) {
            option.headers.addAll({"Authorization": token});
          }

          return handler.next(option);
        }

        if (option.headers.containsKey("requiresToken")) {
          option.headers.remove("requiresToken");

          //add the token to the header
          final String token = await AppSession().getToken();

          option.headers.addAll({"Authorization": token});
          return handler.next(option);
        }

        return handler.next(option);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException err, handler) {
        dynamic res = err.response?.data;

        String? message;
        if (res != null) {
          if (err.response?.data is Map<String, dynamic>) {
            final jsonData = err.response?.data as Map<String, dynamic>;
            message = jsonData["message"];
          }
        }

        switch (err.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.badCertificate:
          case DioExceptionType.connectionError:
          case DioExceptionType.receiveTimeout:
            throw DeadlineExceededException(
              err.requestOptions,
              customMessage: message,
            );
          case DioExceptionType.badResponse:
            switch (err.response?.statusCode) {
              case 400:
                throw BadRequestException(
                  err.requestOptions,
                  customMessage: message,
                );
              case 401:

                /// TODO: handle unauthorized
                // AppServices.navRouter.replaceAll([
                //   LoginPageRoute(
                //     unAuthorized: true,
                //     onLoginResult: (_) {
                //       if (_) {
                //         AppServices.navRouter.replace(const HomePageRoute());
                //       }
                //     },
                //   ),
                // ]);
                throw UnauthorizedException(
                  err.requestOptions,
                  customMessage: message,
                );
              case 403:

                /// TODO: handle unverified
                // AppServices.navRouter.replaceAll([
                //   LoginPageRoute(
                //     unAuthorized: true,
                //     onLoginResult: (_) {
                //       if (_) {
                //         AppServices.navRouter.replace(const HomePageRoute());
                //       }
                //     },
                //   ),
                // ]);
                throw UnauthorizedException(
                  err.requestOptions,
                  customMessage: message,
                );
              case 404:
                throw NotFoundException(
                  err.requestOptions,
                  customMessage: message,
                );
              case 409:
                throw ConflictException(
                  err.requestOptions,
                  customMessage: message,
                );
              case 429:
                throw TooManyRequestException(
                  err.requestOptions,
                  customMessage: message,
                );
              case 500:
                throw InternalServerErrorException(
                  err.requestOptions,
                  customMessage: message,
                );
              case 503:
                throw InternalServerErrorException(
                  err.requestOptions,
                  customMessage: message,
                );
              case 502:
                throw InternalServerErrorException(
                  err.requestOptions,
                  customMessage: message,
                );
              default:
                throw InternalServerErrorException(
                  err.requestOptions,
                  customMessage: message,
                );
            }
          case DioExceptionType.cancel:
            break;
          case DioExceptionType.unknown:
            throw UnknownException(
              err.requestOptions,
              customMessage: message,
            );
        }

        return handler.next(err);
      },
    ));
    return dio;
  }

  /// A raw Dio instance without any interceptors
  static Dio createRawDio() {
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 90),
      connectTimeout: const Duration(seconds: 90),
      // sendTimeout: const Duration(seconds: 90),
    ));

    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 100,
      ));
    }

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (option, handler) async {
        option.headers.addAll({"Content-Type": "application/json"});
        option.headers.addAll({"Accept": "application/json"});

        if (!option.headers.containsKey("computeAPI")) {
          option.headers.addAll({
            "accept-language": AppSession().getLanguage(),
          });
        } else {
          option.headers.remove("computeAPI");
        }

        if (option.headers.containsKey("optionalToken")) {
          option.headers.remove("optionalToken");

          //add the token to the header
          final String token = await AppSession().getToken();
          if (token.isNotEmpty) {
            option.headers.addAll({"X-Access-Token": token});
          }

          return handler.next(option);
        }

        if (option.headers.containsKey("requiresToken")) {
          option.headers.remove("requiresToken");

          //add the token to the header
          final String token = await AppSession().getToken();

          option.headers.addAll({"X-Access-Token": token});
          return handler.next(option);
        }

        return handler.next(option);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (DioException err, handler) {
        return handler.next(err);
      },
    ));
    return dio;
  }

  Future<ApiResponse<T>> request<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJsonT,
  }) async {
    ApiResponse<T> apiResponse;
    Response response;
    try {
      switch (method) {
        case MethodType.get:
          response = await dio.get(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.post:
          response = await dio.post(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.put:
          response = await dio.put(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.delete:
          response = await dio.delete(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.patch:
          response = await dio.patch(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
      }

      apiResponse = ApiResponse(
        data: fromJsonT?.call(response.data),
        statusCode: response.statusCode.toString(),
      );
      return apiResponse;
    } catch (err) {
      log("request error: ${err.toString()}");
      String errorMessage = LanguageValue.not_found_exception;
      if (err is DioException) {
        errorMessage = err.toString();
      }

      throw errorMessage;
    }
  }

  /// POST
  static String getPost = "posts";
}

class BadRequestException extends DioException {
  BadRequestException(this.r, {required this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.bad_request_exception;
  }
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(this.r, {this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.internal_server_error_exception;
  }
}

class ConflictException extends DioException {
  ConflictException(this.r, {required this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.conflict_exception;
  }
}

class UnauthorizedException extends DioException {
  UnauthorizedException(this.r, {required this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.unauthorized_exception;
  }
}

class UnverifiedException extends DioException {
  UnverifiedException(this.r, {required this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.unverified_exception;
  }
}

class NotFoundException extends DioException {
  NotFoundException(this.r, {required this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.not_found_exception;
  }
}

class UnknownException extends DioException {
  UnknownException(this.r, {required this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.something_went_wrong;
  }
}

class DeadlineExceededException extends DioException {
  DeadlineExceededException(this.r, {required this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.timeout_exception;
  }
}

class TooManyRequestException extends DioException {
  TooManyRequestException(this.r, {required this.customMessage})
      : super(requestOptions: r);

  final RequestOptions r;
  final String? customMessage;

  @override
  String toString() {
    return customMessage ?? LanguageValue.too_many_requests_exception;
  }
}
