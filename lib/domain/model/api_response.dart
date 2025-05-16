class ApiResponse<T> {
  T? data;
  String? statusCode;
  String? statusMessage;

  ApiResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
  });

  @override
  String toString() {
    return 'ApiResponse<$T>{data: $data, statusCode: $statusCode, statusMessage: $statusMessage}';
  }
}
