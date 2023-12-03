import 'package:intl/intl.dart';

String formattedName(name) {
  List<String> nameParts = name.split(' ');
  String formattedName = '';
  if (nameParts.length >= 3) {
    String firstName = nameParts[0];
    String middleName = nameParts[1];

    formattedName = '$firstName $middleName';
  } else {
    String firstName = nameParts[0];
    formattedName = firstName;
  }

  return formattedName;
}

String formattedCurrency(value) {
  final formatter = NumberFormat('#,##0', 'id_ID');
  return formatter.format(value);
}

String formattedDate(String date) {
  final formatter = DateFormat('dd MMMM yyyy');
  return formatter.format(DateTime.parse(date));
}
