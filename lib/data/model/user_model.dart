class User {
  final String userId;
  final String userName;
  final String userEmail;
  final String userPhoto;
  final String currentBalance;
  final String income;
  final String outcome;

  User({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPhoto,
    required this.currentBalance,
    required this.income,
    required this.outcome,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPhoto: json["user_photo"],
        currentBalance: json["current_balance"],
        income: json["income"],
        outcome: json["outcome"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_photo": userPhoto,
        "current_balance": currentBalance,
        "income": income,
        "outcome": outcome,
      };
}
