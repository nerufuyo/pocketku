import 'package:flutter/material.dart';
import 'package:pocketku/presentation/styles/pallet.dart';
import 'package:pocketku/presentation/styles/typography.dart';

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({
    super.key,
    required this.balance,
    required this.income,
    required this.expense,
  });

  final String balance;
  final String income;
  final String expense;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => IntrinsicHeight(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: primary50,
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
                'My Detail Balance',
                style: headline2.copyWith(color: white),
              ),
              const SizedBox(height: 16),
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
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          2,
                          (rowIndex) => Text(
                            colIndex == 0
                                ? rowIndex == 0
                                    ? 'Total Balance'
                                    : balance
                                : colIndex == 1
                                    ? rowIndex == 0
                                        ? 'Total Income'
                                        : income
                                    : rowIndex == 0
                                        ? 'Total Expense'
                                        : expense,
                            style: subtitle2.copyWith(
                              color: colIndex == 0
                                  ? white
                                  : colIndex == 1
                                      ? success
                                      : danger,
                            ),
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
                title: 'Monthly Data',
                titleColor: success,
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
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: titleColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: headline5.copyWith(color: white),
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
          color: warning,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.only(top: 8, bottom: 24),
      ),
    );
  }
}
