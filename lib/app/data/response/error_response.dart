class ErrorResponse {
  late List<Errors> _errors;

  List<Errors> get errors => _errors;

  ErrorResponse({required List<Errors> errors}) {
    _errors = errors;
  }

  ErrorResponse.fromJson(dynamic json) {
    if (json["errors"] != null) {
      _errors = [];
      json["errors"].forEach((V) {
        _errors.add(Errors.fromJson(V));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_errors != null) {
      map["errors"] = _errors.map((e) => e.toJson()).toList();
    }
    return map;
  }
}

class Errors {
  late String _code;
  late String _message;

  String get code => _code;
  String get message => _message;

  Errors({String? code, String? message}) {
    _code = code!;
    _message = message!;
  }

  Errors.fromJson(dynamic json) {
    _code = json["code"];
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["code"] = _code;
    map["message"] = _message;
    return map;
  }
}
