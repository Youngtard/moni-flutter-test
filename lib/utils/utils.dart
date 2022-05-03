import 'dart:io';

import 'package:intl/intl.dart';

final currencyFormat = NumberFormat("#,##0", "en_US");
final nairaSymbol = NumberFormat.simpleCurrency(locale: Platform.localeName, name: "NGN");