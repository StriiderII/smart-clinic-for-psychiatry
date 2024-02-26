import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_clinic_for_psychiatry/presentation/common/components/appTheme/my_theme.dart';

import '../model/selection_model.dart';

Widget option({
  required Selection value,
  required IconData icon,
  required String text,
  required BuildContext context,
  required Selection select,
}) {
  final double width = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: () {
      selection.value = value;
    },
    child: Container(
      height: 200,
      width: width * 0.35,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorSelect(selection: selection.value, value: value, color: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 100,
            color: colorSelect(selection: select, value: value, color: 2),
          ),
          Text(
            text,
            style: TextStyle(
              color: colorSelect(selection: select, value: value, color: 2),

            ),
          ),
        ],
      ),
    ),
  );
}

Color colorSelect(
    {required Selection selection, required Selection value, required int color}) {
  if (color == 1) {
    return (selection == value ? MyTheme.primaryLight : MyTheme.whiteColor);
  } else if (color == 2) {
    return (selection == value ?  MyTheme.whiteColor : MyTheme.blackColor);
  } else {
    return  MyTheme.whiteColor;
  }
}
