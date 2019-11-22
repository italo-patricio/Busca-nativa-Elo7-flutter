import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

class Api extends DioForNative {
  Api([BaseOptions options]):super(options){
    this.options.baseUrl = 'https://5dc05c0f95f4b90014ddc651.mockapi.io/elo7/api';
  }
}
