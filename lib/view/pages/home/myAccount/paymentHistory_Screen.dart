import 'package:flutter/material.dart';
import 'package:you_can/language/locale.dart';
import 'package:you_can/view/widgets/payment_history_widget.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Description '),
                Text('Date'),
                Text('Payment Method'),
                Text('Value'),
              ],
            ),
           SizedBox(
             height: size.height,
             child: ListView.separated(
                 scrollDirection: Axis.vertical,
                 itemBuilder: (context, index) {
               return  PaymentHistoryWidget(icon: Icons.payment, cache: '40\$', Date: '22-03-2022', Description: 'Level 3', paymentMethod: 'Visa');
             },
                 separatorBuilder: (context, index) {
               return Divider();
             }, itemCount: 5),
           ),
            SizedBox(height: size.height*0.1,),
          ],
        ),
      ),
    );
  }
}
