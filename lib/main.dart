Future<int> fetchNumber1() async {
  await Future.delayed(Duration(seconds: 2), () {
    return 2;
  });
  return 2;
}

Future<int> fetchNumber2() async {
  await Future.delayed(Duration(seconds: 2));
  return 2;
}

Future<int> addNumbers() async {
  int n1 = await fetchNumber1();
  int n2 = await fetchNumber2();
  return n1 + n2;
}

void main() async {
  int data = await addNumbers();
  print(data);
}
// Task
// Future<int> fetchNumber1() async {
//   await Future.delayed(Duration(seconds: 2));
//   return 2;
// }



// void main()  {
//   int data =  fetchNumber1();

//   print(data);
// }