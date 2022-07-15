
class ResponseModel {
  final bool _isSuccess;
  final String _message;
  final int _statsCode;
  ResponseModel(this._isSuccess, this._message, this._statsCode);

  String get message => _message;
  bool get isSuccess => _isSuccess;
  int get statsCode => _statsCode;
}
