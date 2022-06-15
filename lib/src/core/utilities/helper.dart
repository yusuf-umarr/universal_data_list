// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// extension HelperExtension on BuildContext {



// // extension DateHelper on DateTime {
  
//    String formatDate() {
//      final formatter = DateFormat(dateFormatter);
//       return formatter.format(this);
//   }
//   bool isSameDate(DateTime other) {
//     return this.year == other.year &&
//         this.month == other.month &&
//         this.day == other.day;
//   }

//   int getDifferenceInDaysWithNow() {
//     final now = DateTime.now();
//     return now.difference(this).inDays;
//   }
// // }


//  bool isAdult(String birthDateString) {
//     String datePattern = "dd-MM-yyyy";
//     DateTime today = DateTime.now();
//     DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
//     DateTime adultDate = DateTime(
//       birthDate.year + 15,
//       birthDate.month,
//       birthDate.day,
//     );

//     return adultDate.isBefore(today);
//   }
// }