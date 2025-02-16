void main() {
  int number = 10;

  // Example of if-else statement
  if (number > 0) {
    print('The number is positive.');
  } else if (number < 0) {
    print('The number is negative.');
  } else {
    print('The number is zero.');
  }

  // Example of switch statement
  String grade = 'A';

  switch (grade) {
    case 'A':
      print('Excellent!');
      break;
    case 'B':
      print('Good!');
      break;
    case 'C':
      print('Fair!');
      break;
    case 'D':
      print('Poor!');
      break;
    case 'F':
      print('Fail!');
      break;
    default:
      print('Invalid grade.');
  }
}
