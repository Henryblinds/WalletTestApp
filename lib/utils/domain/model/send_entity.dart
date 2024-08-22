
import 'package:equatable/equatable.dart';

class SendEntity extends Equatable {
  SendEntity({
    this.amount,
    this.created,
    this.userId,
    this.id
  });

  String? amount;
  String? created;
  int? userId;
  int? id;

  @override
  List<Object?> get props => [
    amount,
    created,
    userId,
    id,
  ];
}