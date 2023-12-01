import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pocketku/data/model/transaction_model.dart';
import 'package:pocketku/data/model/user_model.dart';

class Repository {
  Future<User> getUser() async {
    final data = await rootBundle.loadString('lib/assets/jsons/user.json');

    try {
      Map<String, dynamic> json = jsonDecode(data)['data'];
      return User.fromJson(json);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Transactions>> getTransactions() async {
    final data =
        await rootBundle.loadString('lib/assets/jsons/transactions.json');

    try {
      List<dynamic> json = jsonDecode(data)['data'];
      return json.map((e) => Transactions.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
