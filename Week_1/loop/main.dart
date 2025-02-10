void main() {
  bai1();
  bai2();
  bai3();
  bai4();
  bai5();
  bai6();
  bai7();
  bai8();
  bai9();
  bai10();
  bai11();
  bai12();
}

//Tìm tổng của các số từ 1 đến n.
void bai1() {
  int n = 5;
  int sum = 0;
  for (int i = 1; i <= n; i++) {
    sum += i;
  }
  print('Sum: $sum');
}

//Tìm tổng của các số chẵn từ 1 đến n.
void bai2() {
  int n = 5;
  int sum = 0;
  for (int i = 2; i <= n; i += 2) {
    sum += i;
  }
  print('Sum: $sum');
}

//Tìm tổng của các số lẻ từ 1 đến n.
void bai3() {
  int n = 5;
  int sum = 0;
  for (int i = 1; i <= n; i += 2) {
    sum += i;
  }
  print('Sum: $sum');
}

//In ra các số từ 1 đến n theo thứ tự ngược.
void bai4() {
  int n = 5;
  for (int i = n; i >= 1; i--) {
    print(i);
  }
}

//In ra một tam giác Pascal.
void bai5() {
  int n = 5;
  for (int i = 0; i < n; i++) {
    int number = 1;
    for (int j = 0; j <= i; j++) {
      print('$number ');
      number = number * (i - j) ~/ (j + 1);
    }
    print('');
  }
}

//In ra một bảng cửu chương.
void bai6() {
  for (int i = 1; i <= 9; i++) {
    for (int j = 1; j <= 9; j++) {
      print('${i * j} ');
    }
    print('');
  }
}

//In ra một bảng cửu chương theo thứ tự ngược.
void bai7() {
  for (int i = 9; i >= 1; i--) {
    for (int j = 9; j >= 1; j--) {
      print('${i * j} ');
    }
    print('');
  }
}

//Tìm số lớn nhất trong một danh sách.
void bai8() {
  List<int> list = [1, 2, 3, 4, 5];
  int max = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] > max) {
      max = list[i];
    }
  }
  print('Max: $max');
}

//Tìm số nhỏ nhất trong một danh sách.
void bai9() {
  List<int> list = [1, 2, 3, 4, 5];
  int min = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] < min) {
      min = list[i];
    }
  }
  print('Min: $min');
}

//Tìm số xuất hiện nhiều nhất trong một danh sách.
void bai10() {
  List<int> list = [1, 2, 3, 4, 5, 1, 2, 3, 4, 1];
  Map<int, int> count = {};
  for (int number in list) {
    count[number] = (count[number] ?? 0) + 1;
  }
  int max = list[0];
  for (int number in count.keys) {
    if (count[number]! > count[max]!) {
      max = number;
    }
  }
  print('Most frequent: $max');
}

//Tìm các số hoàn thiện trong một khoảng từ n đến m.
void bai11() {
  int n = 1;
  int m = 100;
  for (int number = n; number <= m; number++) {
    int sum = 0;
    for (int i = 1; i < number; i++) {
      if (number % i == 0) {
        sum += i;
      }
    }
    if (sum == number) {
      print(number);
    }
  }
}

//Tìm số nguyên tố trong một khoảng từ n đến m.
void bai12() {
  int n = 1;
  int m = 100;
  for (int number = n; number <= m; number++) {
    bool isPrime = true;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      print(number);
    }
  }
}
