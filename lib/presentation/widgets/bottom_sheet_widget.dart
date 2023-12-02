import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pocketku/data/utils/constant.dart';
import 'package:pocketku/presentation/styles/pallet.dart';
import 'package:pocketku/presentation/styles/typography.dart';
import 'package:pocketku/presentation/widgets/icon_text_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
    required this.widget,
  });

  final String balance;
  final String income;
  final String expense;
  final Widget widget;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              topSliderButton(context),
              Text(
                'Detail Balance',
                style: headline2.copyWith(color: white),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 4,
                decoration: BoxDecoration(
                  color: warning,
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.symmetric(vertical: 16),
              ),
              customSubtitle(
                title: 'Current Balance',
                titleColor: warning,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    3,
                    (colIndex) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          2,
                          (rowIndex) => IconTextWidget(
                            icon: rowIndex == 0
                                ? colIndex == 0
                                    ? Iconsax.wallet
                                    : colIndex == 1
                                        ? Iconsax.arrow_down_2
                                        : Iconsax.arrow_up_1
                                : null,
                            title: rowIndex == 0
                                ? detailCurrentBalance[colIndex]
                                : colIndex == 0
                                    ? widget.balance
                                    : colIndex == 1
                                        ? widget.income
                                        : widget.expense,
                            color: rowIndex == 1
                                ? colIndex == 1
                                    ? success
                                    : colIndex == 2
                                        ? danger
                                        : white
                                : secondary40,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: secondary10,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              customSubtitle(
                title: 'Recent Transaction',
                titleColor: success,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 4),
                child: widget.widget,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row customSubtitle({
    required String title,
    required Color titleColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: titleColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: headline4.copyWith(color: white),
        ),
      ],
    );
  }

  Center topSliderButton(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.125,
        height: 8,
        decoration: BoxDecoration(
          color: primary40,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(top: 8, bottom: 24),
      ),
    );
  }
}
