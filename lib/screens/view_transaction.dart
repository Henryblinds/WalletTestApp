import 'package:flutter/material.dart';
import 'package:walletexamapp/utils/singleton.dart';

class ViewTransactionScreen extends StatefulWidget {
  const ViewTransactionScreen({super.key});

  @override
  State<ViewTransactionScreen> createState() => _ViewTransactionScreenState();
}

class _ViewTransactionScreenState extends State<ViewTransactionScreen> {
  List<String> _list = [];
  @override
  void initState() {
    _addItem('Luna');
    _addItem('Lyon');
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Transactions ',style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: Singleton().sendModelList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('PHP ${Singleton().sendModelList[index].amount}'),
                            Text(Singleton().sendModelList[index].created!),
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        )
    );
  }

  _addItem(String value) {
    _list.add(value);
  }
}
