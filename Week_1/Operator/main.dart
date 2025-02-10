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
}

//Tính tổng của hai số nguyên a và b và in ra kết quả.
void bai1() {
  int a = 5;
  int b = 10;
  int sum = a + b;
  print('Sum: $sum');
}

//Tìm giá trị nhỏ nhất của ba số nguyên a, b, và c.
void bai2() {
  int a = 5;
  int b = 10;
  int c = 3;
  int min = a;
  if (b < min) {
    min = b;
  }
  if (c < min) {
    min = c;
  }
  print('Min: $min');
}

//Tìm giá trị lớn nhất của ba số nguyên a, b, và c.
void bai3() {
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

//Tìm giá trị trung bình của ba số nguyên a, b, và c.
void bai4() {
  int a = 5;
  int b = 10;
  int c = 3;
  double average = (a + b + c) / 3;
  print('Average: $average');
}

//Viết chương trình kiểm tra xem một số nguyên có phải là số chẵn hay không.
void bai5() {
  int a = 5;
  if (a % 2 == 0) {
    print('$a is even');
  } else {
    print('$a is odd');
  }
}

//Viết chương trình kiểm tra xem một số nguyên có phải là số nguyên tố hay không.
void bai6() {
  int a = 5;
  bool isPrime = true;
  if (a < 2) {
    isPrime = false;
  } else {
    for (int i = 2; i <= a ~/ 2; i++) {
      if (a % i == 0) {
        isPrime = false;
        break;
      }
    }
  }
  if (isPrime) {
    print('$a is prime');
  } else {
    print('$a is not prime');
  }
}

//Viết chương trình tính bậc hai của một số nguyên.
void bai7() {
  int a = 5;
  int square = a * a;
  print('Square: $square');
}

//Viết chương trình tính giai thừa của một số nguyên.
void bai8() {
  int a = 5;
  int factorial = 1;
  for (int i = 1; i <= a; i++) {
    factorial *= i;
  }
  print('Factorial: $factorial');
}

//Viết chương trình kiểm tra xem một năm có phải là năm nhuận hay không.
void bai9() {
  int year = 2020;
  bool isLeapYear = false;
  if (year % 4 == 0) {
    if (year % 100 != 0 || year % 400 == 0) {
      isLeapYear = true;
    }
  }
  if (isLeapYear) {
    print('$year is a leap year');
  } else {
    print('$year is not a leap year');
  }
}

//Viết chương trình kiểm tra xem một chuỗi có phải là chuỗi palindrome hay không.
void bai10() {
  String str = 'madam';
  bool isPalindrome = true;
  for (int i = 0; i < str.length ~/ 2; i++) {
    if (str[i] != str[str.length - i - 1]) {
      isPalindrome = false;
      break;
    }
  }
  if (isPalindrome) {
    print('$str is a palindrome');
  } else {
    print('$str is not a palindrome');
  }
}
