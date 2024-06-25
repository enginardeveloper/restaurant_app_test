import 'package:intl/intl.dart';

class PriceUtils {
  PriceUtils._();

  //static final value =  NumberFormat("#,##0.00", "en_US");
   static final value =  NumberFormat.currency(locale: 'en', symbol: '');

  static numberToPriceFormat(num number) => value.format(number);
}