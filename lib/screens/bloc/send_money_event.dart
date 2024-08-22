part of 'send_money_bloc.dart';

abstract class SendMoneyEvent extends Equatable {}

class SetSendMoneyEvent extends SendMoneyEvent {
  final String amount;
  final String dateCreated;
  SetSendMoneyEvent({required this.amount, required this.dateCreated});
  @override
  List<Object?> get props => [
    amount, dateCreated
  ];
}