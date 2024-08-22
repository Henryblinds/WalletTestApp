
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:walletexamapp/utils/constant.dart';
import 'package:walletexamapp/utils/domain/model/send_model.dart';

class ApiHandler {
  ApiHandler._();

  static Future<SendModel> sendMoney({Map<String, dynamic> parameters = const {}}) async {
    final Dio dio = Dio();
    dio.options.baseUrl = baseUrl;
    dio.options.headers['Accept'] = 'application/json';
    Response response = await dio.post(sendMoneyEndpoint, data: parameters);

    final responseBody = jsonEncode(response.data) as dynamic;
    var decodedBody = json.decode(responseBody) as Map<String, dynamic>;
    SendModel model = SendModelMapper.fromMap(decodedBody);

    return model;
  }
}