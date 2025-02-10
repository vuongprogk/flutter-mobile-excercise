// Regular function
int add(int a, int b) {
  return a + b;
}

// Lambda function
var multiply = (int a, int b) => a * b;

void main(){
  print(add(2, 3));
  print(multiply(2, 3));
}