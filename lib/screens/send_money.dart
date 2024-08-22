import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:walletexamapp/screens/bloc/send_money_bloc.dart';
import 'package:walletexamapp/screens/bloc/send_money_state.dart';
import 'package:walletexamapp/screens/respositories/send_money_repo.dart';
import 'package:walletexamapp/utils/singleton.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({super.key});

  @override
  State<SendMoneyScreen> createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  final TextEditingController _amountController = TextEditingController();
  late SendMoneyBloc sendMoneyBloc;

  @override
  void initState() {
    sendMoneyBloc = BlocProvider.of<SendMoneyBloc>(context);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            title: const Text('Wallet App'),
          ),
          body: Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Send Money', style: TextStyle(
                  fontSize: 18,
                ),),
                TextField(
                  key: const Key('amountKey'),
                  controller: _amountController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter amount',
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                ),
                const SizedBox(height: 20,),
                BlocConsumer(
                  bloc: sendMoneyBloc,
                  listener: (context, state) {
                    if (state is SendMoneyError) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _showBottomSheetResult(context, 'Issue Encountered');
                      });
                    }
                    if (state is SendMoneySuccess) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Singleton().myBalance = Singleton().myBalance - double.parse(_amountController.text);
                        Singleton().sendModelList.add(state.response);
                        _amountController.clear();
                        _showBottomSheetResult(context, 'Success');
                      });
                    }
                  },
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            child: const Text('Submit'),
                            onPressed: () {
                              _validateData();
                              // _showBottomSheetResult(context, 'Success');
                            },
                          ),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        )
    );
  }

  _validateData() {
    if (_amountController.text.isNotEmpty) {
      String amount = _amountController.text;
      if (double.parse(amount) > Singleton().myBalance) {
        _amountController.clear();
        _showBottomSheetResult(context, 'Insufficient Balance.');
      } else {
        var now = DateTime.now();
        var formatter = DateFormat('yyyy-MM-dd');
        String formattedDate = formatter.format(now);
        sendMoneyBloc.add(SetSendMoneyEvent(amount: amount, dateCreated: formattedDate));
      }
    } else {
      _showBottomSheetResult(context, 'Amount is required.');
    }
  }

  Future<void> _showBottomSheetResult(BuildContext context,
      String message) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35),
        ),
      ),
      builder: (context) =>
          StatefulBuilder(
              builder: (context, setState) {
                return SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(message, style: const TextStyle(fontSize: 20),),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: FilledButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
          ),
    );
  }
}
