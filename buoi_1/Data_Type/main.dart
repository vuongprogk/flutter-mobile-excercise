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
  bai13();
  bai14();
  bai15();
  bai16();
  bai17();
  bai18();
}

// Tạo biến với các kiểu dữ liệu khác nhau và gán giá trị cho chúng.
void bai1() {
  int a = 5;
  double b = 10.5;
  String c = 'Hello';
  bool d = true;
  print('a: $a');
  print('b: $b');
  print('c: $c');
  print('d: $d');
}

//Tạo một mảng và gán giá trị cho mảng đó.
void bai2() {
  List<int> list = [1, 2, 3, 4, 5];
  print('list: $list');
}

//Tìm kiếm một giá trị trong mảng.
void bai3() {
  List<int> list = [1, 2, 3, 4, 5];
  int search = 3;
  if (list.contains(search)) {
    print('Found $search in list');
  } else {
    print('Not found $search in list');
  }
}

//Sắp xếp một mảng tăng dần hoặc giảm dần.
void bai4() {
  List<int> list = [5, 2, 3, 4, 1];
  list.sort();
  print('Ascending: $list');
  list.sort((a, b) => b.compareTo(a));
  print('Descending: $list');
}

//Tạo một Map và gán giá trị cho Map đó.
void bai5() {
  Map<String, int> map = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
  print('map: $map');
}

//Tìm kiếm một giá trị trong Map.
void bai6() {
  Map<String, int> map = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
  String search = 'two';
  if (map.containsKey(search)) {
    print('Found $search in map');
  } else {
    print('Not found $search in map');
  }
}

//Thêm một phần tử mới vào Map.
void bai7() {
  Map<String, int> map = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
  map['four'] = 4;
  print('map: $map');
}

//Xóa một phần tử trong Map.
void bai8() {
  Map<String, int> map = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
  map.remove('two');
  print('map: $map');
}

//Sử dụng dynamic để chuyển đổi giữa các kiểu dữ liệu.
void bai9() {
  dynamic a = 5;
  print('a: $a');
  a = 10.5;
  print('a: $a');
  a = 'Hello';
  print('a: $a');
  a = true;
  print('a: $a');
}

//Sử dụng var để tạo một biến với kiểu dữ liệu tự động.
void bai10() {
  var a = 5;
  var b = 10.5;
  var c = 'Hello';
  var d = true;
  print('a: $a');
  print('b: $b');
  print('c: $c');
  print('d: $d');
}

//Tạo biến kiểu chuỗi và in giá trị của biến này.
void bai11() {
  String a = 'Hello';
  print('a: $a');
}

//Tạo biến kiểu boolean và in giá trị của biến này.
void bai12() {
  bool a = true;
  print('a: $a');
}

//Tạo biến kiểu List và in giá trị của biến này.
void bai13() {
  List<int> list = [1, 2, 3, 4, 5];
  print('list: $list');
}

//Tạo biến kiểu Map và in giá trị của biến này.
void bai14() {
  Map<String, int> map = {'one': 1, 'two': 2, 'three': 3};
  print('map: $map');
}

//Tạo biến kiểu Set và in giá trị của biến này.
void bai15() {
  Set<int> set = {1, 2, 3, 4, 5};
  print('set: $set');
}

//Sử dụng phép gán nhiều biến và in giá trị của các biến này.
void bai16() {
  int a = 5, b = 10;
  double c = 10.5, d = 20.5;
  String e = 'Hello', f = 'World';
  bool g = true, h = false;
  print('a: $a');
  print('b: $b');
  print('c: $c');
  print('d: $d');
  print('e: $e');
  print('f: $f');
  print('g: $g');
  print('h: $h');
}

//Sử dụng hằng số (constants) và in giá trị của hằng số này.
void bai17() {
  const int a = 5;
  const double b = 10.5;
  const String c = 'Hello';
  const bool d = true;
  print('a: $a');
  print('b: $b');
  print('c: $c');
  print('d: $d');
}

//Sử dụng toán tử và gán giá trị cho biến sử dụng toán tử và in giá trị của biến này.
void bai18() {
  int a = 5;
  int b = 10;
  int c = a + b;
  print('c: $c');
}
