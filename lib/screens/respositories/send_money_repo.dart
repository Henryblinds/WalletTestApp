

import 'package:walletexamapp/utils/domain/api_handler.dart';
import 'package:walletexamapp/utils/domain/model/send_model.dart';

abstract class SendMoneyRepository {
  Future<SendModel?> sendMoney({
    required String amount,
    required String date
  });
}

class SendMoneyRepositoryImpl extends SendMoneyRepository {
  @override
  Future<SendModel?> sendMoney({
    required String amount,
    required String date
  }) async {
    Map<String, String> params = {
      'amount': amount,
      'created': date,
      'userId': '209'
    };
    final response = await ApiHandler.sendMoney(parameters: params);

    return response;
  }
}