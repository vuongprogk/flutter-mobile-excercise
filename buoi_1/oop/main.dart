void main() {
  // Create instance of Student and call method
  Student student = Student("John Doe", 20, 3.5, "Computer Science");
  print("Student GPA: ${student.calculateGPA()}");

  // Create instance of Faculty and call method
  Faculty faculty = Faculty("Engineering", ["Math", "Physics", "Chemistry"]);
  faculty.printCourses();

  // Create instance of Teacher and call method
  Teacher teacher = Teacher("Dr. Smith", ["Math", "Physics"]);
  teacher.printCourses();

  // Create instance of Circle and call methods
  Circle circle = Circle(5);
  print("Circle Area: ${circle.area()}");
  print("Circle Perimeter: ${circle.perimeter()}");

  // Create instance of Dog and call methods
  Dog dog = Dog("Buddy");
  dog.eat();
  dog.sleep();
  dog.bark();

  // Create instance of Car and call methods
  Car car = Car("Toyota");
  car.run();
  car.honk();
}

//Tạo một lớp Sinh viên có các thuộc tính như tên, tuổi, điểm trung bình, chuyên ngành và phương thức tính điểm trung bình.
class Student {
  String name;
  int age;
  double gpa;
  String major;

  Student(this.name, this.age, this.gpa, this.major);

  double calculateGPA() {
    return gpa;
  }
}

//Tạo một lớp Khoa có các thuộc tính như tên khoa, danh sách các môn học và phương thức in ra danh sách môn học.
class Faculty {
  String name;
  List<String> courses;

  Faculty(this.name, this.courses);

  void printCourses() {
    print('Courses: $courses');
  }
}

//Tạo một lớp Giáo viên có các thuộc tính như tên giáo viên, danh sách các môn dạy và phương thức in ra danh sách môn dạy.
class Teacher {
  String name;
  List<String> courses;

  Teacher(this.name, this.courses);

  void printCourses() {
    print('Courses: $courses');
  }
}

//Tạo một interface Shape với phương thức tính diện tích và chu vi.
abstract class Shape {
  double area();
  double perimeter();
}

//Tạo lớp hình tròn, hình chữ nhật và hình tam giác kế thừa từ interface Shape.
class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }

  @override
  double perimeter() {
    return 2 * 3.14 * radius;
  }
}

//Tạo một lớp Animal có các thuộc tính như tên động vật, số chân và phương thức giống nhau.
class Animal {
  String name;
  int legs;

  Animal(this.name, this.legs);

  void eat() {
    print('$name is eating');
  }

  void sleep() {
    print('$name is sleeping');
  }
}

//Tạo lớp Dog, Cat kế thừa từ lớp Animal và có các phương thức riêng.
class Dog extends Animal {
  Dog(String name) : super(name, 4);

  void bark() {
    print('$name is barking');
  }
}

//Tạo một lớp Vehicle có các thuộc tính như tên phương tiện, số bánh và phương thức chạy.
class Vehicle {
  String name;
  int wheels;

  Vehicle(this.name, this.wheels);

  void run() {
    print('$name is running');
  }
}

//Tạo lớp ô tô, xe máy kế thừa từ lớp Vehicle và có các phương thức riêng.
class Car extends Vehicle {
  Car(String name) : super(name, 4);

  void honk() {
    print('$name is honking');
  }
}
