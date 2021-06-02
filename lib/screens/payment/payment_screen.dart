import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class PayScreen extends StatelessWidget {
  final String title;

  PayScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
    );
  }
}

Widget buildBody() {
  const _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '29.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  return Center(
    child: Column(
      children: <Widget>[
        GooglePayButton(
            paymentConfigurationAsset: 'gpay.json',
            onPaymentResult: (data) {
              print(data);
            },
            width: 200,
            height: 50,
            style: GooglePayButtonStyle.black,
            type: GooglePayButtonType.pay,
            margin: const EdgeInsets.only(top: 15.0),
            loadingIndicator: const Center(
              child: CircularProgressIndicator(),
            ),
            paymentItems: _paymentItems)
      ],
    ),
  );
}
