import 'package:flutter/material.dart';
import 'package:pocketku/presentation/styles/pallet.dart';
import 'package:pocketku/presentation/styles/typography.dart';
import 'package:pocketku/presentation/widgets/button_widget.dart';

Future<dynamic> customShowDialog(
  BuildContext context, {
  dialogWidth,
  dialogHeight,
  required String dialogTitle,
  required String dialogContent,
  required void Function() dialogOnTap,
}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: IntrinsicHeight(
          child: Container(
            width: dialogWidth ?? MediaQuery.of(context).size.width,
            height: dialogHeight ?? MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    2,
                    (index) => Text(
                      index == 0 ? dialogTitle : dialogContent,
                      style: index == 0 ? headline3 : subtitle1,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    2,
                    (index) => CustomButton(
                      onTap: dialogOnTap,
                      buttonText: index == 0 ? 'Cancel' : 'Yes',
                      buttonTextSize: 16,
                      buttonColor: index == 0 ? white : primary50,
                      buttonTextColor: index == 0 ? primary50 : white,
                      buttonBorderColor: index == 0 ? primary50 : white,
                      width: MediaQuery.of(context).size.width * 0.325,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
