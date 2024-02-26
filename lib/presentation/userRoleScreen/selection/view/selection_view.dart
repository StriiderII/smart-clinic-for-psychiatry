import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smart_clinic_for_psychiatry/presentation/authentication/loginScreen/LoginScreen.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';
import 'package:smart_clinic_for_psychiatry/presentation/userRoleScreen/selection/model/selection_model.dart';
import 'package:smart_clinic_for_psychiatry/presentation/userRoleScreen/selection/viewmodel/selection_viewmodel.dart';

import '../../../../data/database/variables.dart';








class SelectionView extends StatelessWidget {
  static const String routeName = '/selection';
  const SelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyTheme.blackColor,
      appBar: AppBar(
        title: Text(
          'Test',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 50,
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  option(
                    value: Selection.patient,
                    icon: Icons.person_outline_rounded,
                    text: 'Patient',
                    context: context,
                    select: selection.value,
                  ),
                  option(
                    value: Selection.doctor,
                    icon: Icons.drive_eta_outlined,
                    text: 'Doctor',
                    context: context,
                    select: selection.value,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: button(
        context: context,
        text: 'next',
        onPressed: () {
          userType = selection.value;
          Get.to(LoginScreen());
          // Get.offAllNamed(userType == Selection.user ? Routes.clientMapRoute : Routes.driverMapRoute);
        },
      ),
    );
  }
}
Widget button({
  required String text,
  Function()? onPressed,
  required BuildContext context,
}) {
  return SizedBox(
    width: double.infinity,
    height: 60,
    child: TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    ),
  );
}