import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles/styles.dart';
import 'package:payment/feature/presentation/views/widgets/credit_card_item_widget.dart';
import 'package:payment/feature/presentation/views/widgets/parcode_paid_section.dart';
import 'package:payment/feature/presentation/views/widgets/payment_item_info.dart';
import 'package:payment/feature/presentation/views/widgets/total_price.dart';

class ThankCard extends StatelessWidget {
  const ThankCard({
    super.key,
    required this.clientName,
    required this.total,
    required this.transactionTime,
  });

  final String clientName;
  final double total;
  final DateTime transactionTime;

  String _formatDate(DateTime dt) {
    final month = dt.month.toString().padLeft(2, '0');
    final day = dt.day.toString().padLeft(2, '0');
    final year = dt.year.toString();
    return '$month/$day/$year';
  }

  String _formatTime(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final minute = dt.minute.toString().padLeft(2, '0');
    final period = dt.hour < 12 ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0XffD9D9D9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50 + 16),
          const Text(
            'Thank you!',
            textAlign: TextAlign.center,
            style: Styles.font25,
          ),
          const SizedBox(height: 2),
          Text(
            'Your transaction was successful',
            textAlign: TextAlign.center,
            style: Styles.font20,
          ),
          const SizedBox(height: 42),
          PaymentItemInfo(title: "Date", info: _formatDate(transactionTime)),
          const SizedBox(height: 20),
          PaymentItemInfo(title: "Time", info: _formatTime(transactionTime)),
          const SizedBox(height: 20),
          PaymentItemInfo(title: "To", info: clientName),
          const Divider(height: 60, thickness: 2, color: Color(0xFFC7C7C7)),
          TotalPrice(price: '\$${total.toStringAsFixed(2)}'),
          const SizedBox(height: 30),
          const CreditCardItemWidget(),
          const Spacer(),
          const BarCodePaidSection(),
          SizedBox(
            height: ((MediaQuery.of(context).size.height * 0.2 + 20) / 2) - 58,
          ),
        ],
      ),
    );
  }
}
