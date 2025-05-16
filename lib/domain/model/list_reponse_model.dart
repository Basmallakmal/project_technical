class ListResponseModel<T> {
  final List<T> data;

  ListResponseModel({
    required this.data,
  });

  factory ListResponseModel.fromJson(
      dynamic json, T Function(Map<String, dynamic>) fromJsonT) {
    return ListResponseModel(
      data: (json as List<dynamic>)
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson(
      T Function(T) toJsonT, Map<String, dynamic> Function() toJson) {
    return {
      'data': data.map((e) => toJsonT(e)).toList(),
    };
  }

  @override
  String toString() {
    return 'ListResponseModel{data: $data}';
  }
}
