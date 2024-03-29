import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pocketku/data/utils/format.dart';
import 'package:pocketku/data/repository/repository.dart';
import 'package:pocketku/presentation/screens/transaction_screen.dart';
import 'package:pocketku/presentation/styles/pallet.dart';
import 'package:pocketku/presentation/styles/typography.dart';
import 'package:pocketku/presentation/widgets/button_widget.dart';
import 'package:pocketku/presentation/widgets/bottom_sheet_widget.dart';
import 'package:pocketku/presentation/widgets/header_widget.dart';
import 'package:pocketku/presentation/widgets/icon_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> userData = {};
  List<Map<String, dynamic>> transactionData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final user = await Repository().getUser();
    final transactions = await Repository().getTransactions();

    if (mounted) {
      setState(() {
        userData = user.toJson();
        transactionData = transactions.map((e) => e.toJson()).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeaderWidget(userData: userData),
                    _buildCurrentBalance(context),
                    // _buildCurrentTransactionList(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildCurrentBalance(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'My Balance',
            style: headline6.copyWith(color: primary30),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rp${formattedCurrency(
                  int.parse(userData['current_balance'] ?? '0'),
                )}',
                style: headline3.copyWith(
                  color: primary50,
                  fontSize: 36,
                ),
              ),
              IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => showDetailBalance(context),
                icon: const Icon(
                  Iconsax.info_circle,
                  color: primary50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> showDetailBalance(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      builder: (context) => BottomSheetWidget(
        balance: 'Rp${formattedCurrency(
          int.parse(userData['current_balance'] ?? '0'),
        )}',
        income:
            "+ Rp${formattedCurrency(int.parse(userData['income'] ?? '0'))}",
        expense:
            "- Rp${formattedCurrency(int.parse(userData['outcome'] ?? '0'))}",
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            transactionData[0]['transactions_list'].length > 4
                ? 4
                : transactionData[0]['transactions_list'].length,
            (colIndex) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(2, (rowIndex) {
                final transaction =
                    transactionData[0]['transactions_list'][colIndex];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: IconTextWidget(
                    icon: rowIndex == 0
                        ? transaction['transaction_logo'] != ''
                            ? transaction['transaction_logo']
                            : Iconsax.empty_wallet_add
                        : null,
                    title: rowIndex == 0
                        ? transaction['transaction_description']
                        : '${transaction['transaction_type'].contains('Income') ? '+' : '-'} Rp${formattedCurrency(transaction['transaction_amount'])}',
                    color: rowIndex == 0
                        ? secondary40
                        : transaction['transaction_type'].contains('Income')
                            ? success
                            : danger,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildCurrentTransactionList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last Transactions',
                style: headline3,
              ),
              CustomButton(
                buttonBorderColor: primary50,
                onTap: () => Navigator.pushNamed(
                  context,
                  TransactionScreen.routeName,
                ),
                buttonText: 'See All',
                buttonColor: white,
                buttonTextColor: primary50,
                buttonTextSize: 12,
                width: MediaQuery.of(context).size.width * 0.2,
              )
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: transactionData[0]['transactions_list'].length,
            itemBuilder: (context, index) {
              List transactionList = transactionData[0]['transactions_list'];
              return ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: primary20),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: transactionList[index]['transaction_logo'] != ''
                      ? Image.network(
                          transactionList[index]['transaction_logo'])
                      : const Icon(Iconsax.empty_wallet_add),
                ),
                title: Text(
                  transactionList[index]['transaction_description'],
                  style: button,
                ),
                subtitle: Text(
                  formattedDate(transactionList[index]['transaction_date']),
                  style: caption,
                ),
                trailing: Text(
                  transactionList[index]['transaction_type'] == 'Income'
                      ? '+ Rp ${formattedCurrency(transactionList[index]['transaction_amount'])}'
                      : '- Rp ${formattedCurrency(transactionList[index]['transaction_amount'])}',
                  style: button.copyWith(
                    color:
                        transactionList[index]['transaction_type'] == 'Income'
                            ? success
                            : danger,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
