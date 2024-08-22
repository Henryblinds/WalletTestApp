import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:walletexamapp/screens/bloc/send_money_state.dart';
import 'package:walletexamapp/screens/respositories/send_money_repo.dart';

part 'send_money_event.dart';

class SendMoneyBloc extends Bloc<SendMoneyEvent, SendMoneyState> {
  SendMoneyBloc({required this.sendMoneyRepository}) : super(SendMoneyLoading()) {
    on<SetSendMoneyEvent>(sendMoney);
  }
  final SendMoneyRepositoryImpl sendMoneyRepository;

  Future<void> sendMoney(
      SetSendMoneyEvent event,
      Emitter<SendMoneyState> emit,
      ) async {
    emit(SendMoneyLoading());
    final response = await sendMoneyRepository.sendMoney(amount: event.amount, date:event.dateCreated);

    if (response == null) {
      emit(SendMoneyError(msg: 'Error Encountered'));
    } else {
      emit(SendMoneySuccess(response: response));
    }
  }
}