import 'package:http/http.dart' as http;
//Đọc một tập tin văn bản và in nội dung của nó ra màn hình.
import 'dart:io';

void main() {
  bai1();
  bai2();
  bai3();
  bai4();
  bai5();
}

void bai1() {
  var file = File('input.txt');
  var contents = file.readAsStringSync();
  print(contents);
}

//Ghi một chuỗi vào một tập tin văn bản mới.
void bai2() {
  var file = File('output.txt');
  file.writeAsStringSync('Hello, world!');
}

//Sử dụng thư viện http để truy cập một API RESTful và in ra màn hình dữ liệu đầu ra.
void bai3() async {
  var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  print(response.body);
}

//Tạo một form đăng ký cho người dùng với các trường tên, email, mật khẩu và gửi dữ liệu đến một API.
void bai4() {
  var name = 'John Doe';
  var email = 'test@gmail.com';
  var password = 'password123';
  var url = Uri.parse('https://example.com/register');
  var response = http.post(url, body: {
    'name': name,
    'email': email,
    'password': password,
  });

  response.then((res) {
    print('Response status: ${res.statusCode}');
    print('Response body: ${res.body}');
  }).catchError((err) {
    print('Error: $err');
  });
}

//Sử dụng thư viện http để truy cập API và lấy về dữ liệu về thời tiết và hiển thị nó trên màn hình.
void bai5() async {
  var response = await http.get(Uri.parse(
      'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,wind_speed_10m'));
  print(response.body);
}
