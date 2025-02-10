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
}

//Viết một chương trình Dart để kiểm tra xem một số có phải là số chẵn hay là số lẻ.
void bai1() {
  int a = 5;
  if (a % 2 == 0) {
    print('$a is even');
  } else {
    print('$a is odd');
  }
}

//Viết một chương trình Dart để kiểm tra xem một số có phải là số âm hay là số dương.
void bai2() {
  int a = 5;
  if (a >= 0) {
    print('$a is positive');
  } else {
    print('$a is negative');
  }
}

//Viết một chương trình Dart để kiểm tra xem một số có lớn hơn hoặc bằng 0 hay không.
void bai3() {
  int a = 5;
  if (a >= 0) {
    print('$a is greater than or equal to 0');
  } else {
    print('$a is less than 0');
  }
}

//Viết một chương trình Dart để tính tổng của hai số và kiểm tra xem tổng của hai số có lớn hơn hoặc bằng 0 hay không.
void bai4() {
  int a = 5;
  int b = 10;
  int sum = a + b;
  if (sum >= 0) {
    print('Sum: $sum is greater than or equal to 0');
  } else {
    print('Sum: $sum is less than 0');
  }
}

//Viết một chương trình Dart để tìm ra số lớn nhất trong ba số.
void bai5() {
  int a = 5;
  int b = 10;
  int c = 3;
  int max = a;
  if (b > max) {
    max = b;
  }
  if (c > max) {
    max = c;
  }
  print('Max: $max');
}

//Viết một chương trình Dart để tính diện tích hình tròn dựa trên bán kính và kiểm tra xem diện tích của hình tròn có lớn hơn 0 hay không.
void bai6() {
  double radius = 5.0;
  double area = 3.14 * radius * radius;
  if (area > 0) {
    print('Area: $area is greater than 0');
  } else {
    print('Area: $area is less than or equal to 0');
  }
}

//Viết một chương trình Dart để tính tiền thuế dựa trên tổng thu nhập và mức thuế.
void bai7() {
  double income = 50000.0;
  double taxRate = 0.1;
  double tax = income * taxRate;
  print('Tax: $tax');
}

//Viết một chương trình Dart để tìm ra số nhỏ nhất trong một mảng các số.
void bai8() {
  List<int> list = [5, 2, 3, 4, 1];
  int min = list[0];
  for (int i = 1; i < list.length; i++) {
    if (list[i] < min) {
      min = list[i];
    }
  }
  print('Min: $min');
}

//Viết một chương trình Dart để kiểm tra xem một chuỗi có phải là chuỗi rỗng hay không.
void bai9() {
  String str = '';
  if (str.isEmpty) {
    print('String is empty');
  } else {
    print('String is not empty');
  }
}
