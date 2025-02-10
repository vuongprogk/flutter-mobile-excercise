import 'dart:async';

// Function that simulates a network request
Future<String> fetchUserOrder() {
  return Future.delayed(Duration(seconds: 2), () => 'Large Latte');
}

Future<void> main() async {
  print('Fetching user order...');
  // Await the result of the fetchUserOrder function
  var order = await fetchUserOrder();
  print('User order: $order');
}
