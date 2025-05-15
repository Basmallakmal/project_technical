import 'dart:io';
import 'dart:math' as math;

import 'package:intl/intl.dart';

class Utils {
  static String genereateRandomNumber(List<String> existingNumbers) {
    var random = math.Random();
    var randomNumber = random.nextInt(99);
    var randomNumberString = randomNumber.toString().padLeft(2, '0');

    if (existingNumbers.contains(randomNumberString)) {
      return genereateRandomNumber(existingNumbers);
    }

    if (randomNumberString.contains("00") || randomNumberString == "0") {
      return genereateRandomNumber(existingNumbers);
    }

    return randomNumberString;
  }

  static String generateRandomString(int len) {
    var r = math.Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  static String generateRandomUniqeCode(int len) {
    var r = math.Random();
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  static String generateRandomNumber(int len) {
    var r = math.Random();
    const chars = '1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  static String generatePhotoName() {
    var now = DateTime.now();
    var randomNumber = Utils.generateRandomString(5);
    var photoName =
        "IMG${now.year}${now.month}${now.day}${now.hour}${now.minute}${now.second}${now.millisecond}${now.microsecond}$randomNumber.jpg";
    return photoName;
  }

  static String checkOS() {
    String os = Platform.operatingSystem;
    return os;
  }

  static String convertDateTime({
    required String date,
    String format = "dd MMM yyyy HH:mm",
  }) {
    DateTime dateTime = DateTime.parse(date).toLocal();
    String formattedDate = DateFormat(format, 'ID_id').format(dateTime);
    return formattedDate;
  }

  static String formatToIDR(String value) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp. ',
      decimalDigits: 0,
    ).format(num.parse(value.toString()));
  }

  static String formatToCurrencyOnly(String value) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    ).format(num.tryParse(value.toString()) ?? 0);
  }
}
