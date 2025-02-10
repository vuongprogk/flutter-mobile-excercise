void main() {
  // For loop
  for (int i = 0; i < 5; i++) {
    print('For loop: $i');
  }

  // While loop
  int j = 0;
  while (j < 5) {
    print('While loop: $j');
    j++;
  }

  // Do-while loop
  int k = 0;
  do {
    print('Do-while loop: $k');
    k++;
  } while (k < 5);

  // For-in loop
  var numbers = [1, 2, 3, 4, 5];
  for (var number in numbers) {
    print('For-in loop: $number');
  }

  // ForEach loop
  numbers.forEach((number) {
    print('ForEach loop: $number');
  });
}
