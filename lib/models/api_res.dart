class ApiRes {
  bool isSucceful;
  String message;

  ApiRes({
    this.isSucceful=false,
    this.message=""
  });

  factory ApiRes.fromJson(Map<String, dynamic> json) {
    final instance = ApiRes(
      isSucceful: json['ok'] ?? false,
      message: json['message'] ?? "",
    );
    return instance;
  }
}