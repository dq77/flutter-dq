class Greetings {
  greetings () {
    DateTime dt = new DateTime.now();
    int hour = dt.hour;
    print(dt);
    if (hour >4 && hour<6) {
      return '凌晨好。';
    } else if (hour>6 && hour<9) {
      return '早上好。';
    }else if (hour>9 && hour< 12) {
      return '上午好。';
    } else if (hour>12 && hour<14) {
      return '中午好。';
    } else if (hour>14 && hour<17) {
      return '下午好。';
    } else if (hour>17 && hour<19) {
      return '傍晚好。';
    } else if (hour>19 && hour<22) {
      return '晚上好。';
    } else {
      return '夜深了。';
    }
  }
}