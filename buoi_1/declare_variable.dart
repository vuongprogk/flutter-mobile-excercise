void main() {
  // var sử dung để khai báo biến không cần xác định kiểu dữ liệu
  var greeting_var = "Hello world using var"; 
  
  // const sử dụng để khai báo biến không thể thay đổi giá trị
  const greeting_const = "Hellow world using const"; 
  
  // final sử dụng để khai báo biến không thể thay đổi giá 
  //trị khi nhận giá trị lần đầu khi runtime
  final greeting_final = "Hello world using final";
  print(greeting_var);
  print(greeting_const);
  print(greeting_final);
}