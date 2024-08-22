
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:walletexamapp/screens/send_money.dart';
import 'package:walletexamapp/screens/view_transaction.dart';
import 'package:walletexamapp/utils/singleton.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String balance = '0.0';
  String hideLabel = 'hide';
  String hideChars = '***.*';
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
    return VisibilityDetector(
        key: const Key('WalletHome'),
        onVisibilityChanged: (visibility) {
          var visiblePercentage = visibility.visibleFraction * 100;
          if (visiblePercentage > 0.0) {
            setState(() {
              balance = '${Singleton().myBalance}';
            });
          }
        },
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 1,
                title: const Text('Wallet App',textDirection: TextDirection.ltr,),
              ),
              body: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          children: [
                            Text('PHP $balance',style: const TextStyle(
                                fontSize: 32
                            ),),
                            const SizedBox(width: 30,),
                            GestureDetector(
                                onTap: () {
                                  if (isHide) {
                                    hideLabel = 'show';
                                    balance = hideChars;
                                  } else {
                                    hideLabel = 'hide';
                                    balance = '${Singleton().myBalance}';
                                  }
                                  isHide = !isHide;
                                  setState(() {});
                                }, child: Text(hideLabel,style: const TextStyle(
                                fontSize: 24
                            ),))
                          ],
                        ),),
                      const Text('Balance',style: TextStyle(
                          fontSize: 24
                      ),),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FilledButton(
                              key: const Key('sendBtn'),
                              child: const Text('Send Money'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SendMoneyScreen()),
                                );
                              },
                            ),
                            FilledButton(
                              child: const Text('View Transactions'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const ViewTransactionScreen()),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            )
        ),
    );
  }
}
