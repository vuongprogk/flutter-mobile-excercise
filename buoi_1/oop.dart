// Class with constructor, getter, and setter
class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  set name(String name) => _name = name;

  int get age => _age;
  set age(int age) => _age = age;
}

// Inheritance
class Student extends Person {
  String _studentId;

  Student(String name, int age, this._studentId) : super(name, age);

  String get studentId => _studentId;
  set studentId(String studentId) => _studentId = studentId;
}

// Abstract class
abstract class Animal {
  void makeSound();
}

// Mixin
mixin Flyer {
  void fly() {
    print("Flying");
  }
}

// Class using mixin
class Bird extends Animal with Flyer {
  @override
  void makeSound() {
    print("Chirp");
  }
}

void main() {
  // Create a Person instance
  Person person = Person("Alice", 30);
  print("Person: ${person.name}, Age: ${person.age}");

  // Create a Student instance
  Student student = Student("Bob", 20, "S12345");
  print("Student: ${student.name}, Age: ${student.age}, ID: ${student.studentId}");

  // Create a Bird instance
  Bird bird = Bird();
  bird.makeSound();
  bird.fly();
}
