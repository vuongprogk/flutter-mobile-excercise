import 'dart:io';

//Tạo một exception class mới và ném nó khi xảy ra lỗi nhất định.
class MyException implements Exception {
  String errorMessage() {
    return 'This is an exception';
  }
}

//Viết một hàm xử lý ngoại lệ để gọi hàm có thể gây ra ngoại lệ.
void bai2() {
  try {
    throw MyException();
  } catch (e) {
    if (e is MyException) {
      print(e.errorMessage());
    } else {
      print('Unknown exception: $e');
    }
  }
}

//Tìm cách kiểm tra một số nguyên có phải là số chẵn hay lẻ bằng cách sử dụng exception handling.
void bai3(int number) {
  try {
    if (number % 2 == 0) {
      print('$number is even');
    } else {
      print('$number is odd');
    }
  } catch (e) {
    print('Error: $e');
  }
}

//Viết một hàm tìm kiếm từ điển bằng cách sử dụng exception handling để xử lý trường hợp tìm kiếm không thành công.
void bai4(Map<String, String> dictionary, String word) {
  try {
    print('Meaning of $word: ${dictionary[word]}');
  } catch (e) {
    print('Error: $e');
  }
}

//Viết một hàm để kiểm tra xem một chuỗi có phải là số hay không bằng cách sử dụng exception handling.
void bai5(String number) {
  try {
    int.parse(number);
    print('$number is a number');
  } catch (e) {
    print('$number is not a number');
  }
}

//Tìm cách sử dụng exception handling để xử lý lỗi trong quá trình ghi file.
void bai6(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content);
    print('Write file: $content');
  } catch (e) {
    print('Error: $e');
  }
}

//Viết một hàm để tính toán giá trị trung bình cộng của một mảng số bằng cách sử dụng exception handling để xử lý trường hợp mảng trống.
double bai7(List<int> numbers) {
  try {
    if (numbers.isEmpty) {
      throw Exception('Empty list');
    }
    return numbers.reduce((a, b) => a + b) / numbers.length;
  } catch (e) {
    print('Error: $e');
    return 0;
  }
}

//Sử dụng exception handling để xử lý trường hợp nhập sai dữ liệu từ người dùng.
void bai8() {
  try {
    String? input = stdin.readLineSync();
    if (input != null) {
      int a = int.parse(input);
      print('a: $a');
    } else {
      print('No input provided');
    }
  } catch (e) {
    print('Error: $e');
  }
}

//Sử dụng exception handling để xử lý trường hợp kết nối mạng không thành công.
void bai9() {
  try {
    throw SocketException('No internet connection');
  } catch (e) {
    print('Error: $e');
  }
}
