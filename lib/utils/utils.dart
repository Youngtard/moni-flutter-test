import 'dart:io';
import 'dart:math';
import 'package:intl/intl.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");
final nairaSymbol = NumberFormat.simpleCurrency(locale: Platform.localeName, name: "NGN");

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
final Random _rnd = Random.secure();

String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(
          _rnd.nextInt(_chars.length),
        ),
      ),
    );
