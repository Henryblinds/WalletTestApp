
import 'package:walletexamapp/utils/domain/model/send_model.dart';

class Singleton {
  Singleton._privateConstructor();

  static final Singleton _instance = Singleton._privateConstructor();

  factory Singleton() {
    return _instance;
  }

  double myBalance = 500.00;
  List<SendModel> sendModelList = [];
}