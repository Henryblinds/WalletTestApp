

import 'package:equatable/equatable.dart';
import 'package:walletexamapp/utils/domain/model/send_model.dart';

abstract class SendMoneyState extends Equatable {}

class SendMoneyLoading extends SendMoneyState {
  @override
  List<Object?> get props => [];
}

class SendMoneyError extends SendMoneyState {
  SendMoneyError({required this.msg});

  final String msg;

  @override
  List<Object?> get props => [msg];
}

class SendMoneySuccess extends SendMoneyState {
  SendMoneySuccess({required this.response});

  final SendModel response;

  @override
  List<Object?> get props => [response];
}