import 'package:pocketku/data/utils/enum.dart';

class Transactions {
  final String transactionsId;
  final String transactionsYear;
  final String transactionsMonth;
  final int totalIncome;
  final int totalOutcome;
  final int totalBalance;
  final List<TransactionsList> transactionsList;

  Transactions({
    required this.transactionsId,
    required this.transactionsYear,
    required this.transactionsMonth,
    required this.totalIncome,
    required this.totalOutcome,
    required this.totalBalance,
    required this.transactionsList,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        transactionsId: json["transactions_id"],
        transactionsYear: json["transactions_year"],
        transactionsMonth: json["transactions_month"],
        totalIncome: json["total_income"],
        totalOutcome: json["total_outcome"],
        totalBalance: json["total_balance"],
        transactionsList: List<TransactionsList>.from(
          json["transactions_list"].map((x) => TransactionsList.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "transactions_id": transactionsId,
        "transactions_year": transactionsYear,
        "transactions_month": transactionsMonth,
        "total_income": totalIncome,
        "total_outcome": totalOutcome,
        "total_balance": totalBalance,
        "transactions_list":
            List<dynamic>.from(transactionsList.map((x) => x.toJson())),
      };
}

class TransactionsList {
  final String transactionId;
  final DateTime transactionDate;
  final String transactionDescription;
  final String transactionCategory;
  final TransactionType transactionType;
  final int transactionAmount;
  final String transactionLogo;

  TransactionsList({
    required this.transactionId,
    required this.transactionDate,
    required this.transactionDescription,
    required this.transactionCategory,
    required this.transactionType,
    required this.transactionAmount,
    required this.transactionLogo,
  });

  factory TransactionsList.fromJson(Map<String, dynamic> json) =>
      TransactionsList(
        transactionId: json["transaction_id"],
        transactionDate: DateTime.parse(json["transaction_date"]),
        transactionDescription: json["transaction_description"],
        transactionCategory: json["transaction_category"],
        transactionType: transactionTypeValues.map[json["transaction_type"]]!,
        transactionAmount: json["transaction_amount"],
        transactionLogo: json["transaction_logo"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId,
        "transaction_date": transactionDate.toIso8601String(),
        "transaction_description": transactionDescription,
        "transaction_category": transactionCategory,
        "transaction_type": transactionTypeValues.reverse[transactionType],
        "transaction_amount": transactionAmount,
        "transaction_logo": transactionLogo,
      };
}

final transactionTypeValues = EnumValues({
  "Income": TransactionType.income,
  "Outcome": TransactionType.outcome,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
