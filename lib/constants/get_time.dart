import 'package:intl/intl.dart';

String getTime(DateTime msgTime) {
  int time = DateTime.now().difference(msgTime).inMinutes;
  if (time == 0) {
    return '1 m';
  } else if (time < 60) {
    return '$time m';
  } else if (time <= 1440) {
    return DateFormat('hh:mm a').format(msgTime);
  } else if (time <= 43800) {
    return DateFormat('EEE').format(msgTime);
  } else if (time >= 10080) {
    return DateFormat('MMM dd').format(msgTime);
  }
  return '';
}

String getChatTime(DateTime msgTime) {
  int time = DateTime.now().difference(msgTime).inMinutes;
  if (time <= 1440) {
    return DateFormat('hh:mm a').format(msgTime);
  } else if (time <= 43800) {
    return DateFormat('EEE, MMM dd ').format(msgTime);
  } else if (time <= 525600) {
    return DateFormat('MMM dd').format(msgTime);
  } else {
    return DateFormat('EEE, MMM dd ,yyyy').format(msgTime);
  }
}

// bool showTime(DateTime msgTime) {
//   int time = DateTime.now().difference(msgTime).inMinutes;
//   if (time <= 2) {
//     return false;
//   }
//   return true;
// }
