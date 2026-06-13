import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/utils/styles/styles.dart';
import 'package:payment/feature/presentation/views/widgets/check_icon.dart';
import 'package:payment/feature/presentation/views/widgets/dashed_line.dart';
import 'package:payment/feature/presentation/views/widgets/payment_item_info.dart';
import 'package:payment/feature/presentation/views/widgets/total_price.dart';

class ThankViewBody extends StatelessWidget {
  const ThankViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 27),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const ThankCard(),
          Positioned(
            left: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: const CircleAvatar(backgroundColor: Colors.white),
          ),
          Positioned(
            left: 20 + 8,
            right: 20 + 8,
            bottom: MediaQuery.of(context).size.height * 0.2 + 20,
            child: DashedLine(),
          ),
          const Positioned(left: 0, right: 0, top: -50, child: CheckIcon()),
        ],
      ),
    );
  }
}

class ThankCard extends StatelessWidget {
  const ThankCard({super.key});

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
          const PaymentItemInfo(title: "Date", info: "01/24/2023"),
          const SizedBox(height: 20),
          const PaymentItemInfo(title: "Time", info: "10:15 AM"),
          const SizedBox(height: 20),
          const PaymentItemInfo(title: "To", info: "Sam Louis"),

          const Divider(height: 60, thickness: 2, color: Color(0xFFC7C7C7)),
          const TotalPrice(price: r"$50.97"),
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

class CreditCardItemWidget extends StatelessWidget {
  const CreditCardItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/credit_icon.svg",
            width: 22,
            height: 22,
          ),
          const SizedBox(width: 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Credit Card", style: Styles.font18),
              const SizedBox(height: 2),
              Text(
                "Mastercard **78",
                style: Styles.font18.copyWith(color: Color(0xFFB8B8B8)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BarCodePaidSection extends StatelessWidget {
  const BarCodePaidSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FaIcon(FontAwesomeIcons.barcode, size: 64),

        Container(
          width: 113,
          height: 58,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.50, color: const Color(0xFF34A853)),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              "Paid",
              style: Styles.font18.copyWith(color: const Color(0xFF34A853)),
            ),
          ),
        ),
      ],
    );
  }
}
