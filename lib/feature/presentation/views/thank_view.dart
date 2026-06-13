import 'package:flutter/material.dart';
import 'package:payment/core/widgets/custom_appbar.dart';
import 'package:payment/feature/presentation/views/widgets/thank_view_body.dart';

class ThankView extends StatelessWidget {
  const ThankView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onPressed: () => Navigator.pop(context)),
      body: ThankViewBody(),
    );
  }
}
