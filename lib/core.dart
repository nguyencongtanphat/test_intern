import 'dart:math';

import 'package:intern_test/model.dart';

class Core {
  List numberCharactors = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  bool isNumber(String input) {
    for (int i = 0; i < input.length; i++) {
      //check first charactor is number or "-" charactor
      if (i == 0) {
        if (input[i] != '-' && !numberCharactors.contains(input[i])) {
          return false;
        } else {
          if (input[i] == '-' && input.length == 1) {
            return false;
          }
        }
      } else {
        if (!numberCharactors.contains(input[i])) {
          return false;
        }
      }
    }
    return true;
  }

  Number convertStringToArrayNumber(String input) {
    Number num = Number(array: [], isNegative: false);
    if (input[0] == "-") {
      num.isNegative = true;
      input = input.substring(1);
    }
    for (int i = 0; i < input.length; i++) {
      var numInput = int.parse(input[i]);
      num.array.add(numInput);
    }

    return num;
  }

  Number _numStillNotEmpty(Number num1, Number num2) {
    if (num1.array.isNotEmpty) {
      return num1;
    } else {
      return num2;
    }
  }

  Number _sumTwoNumberPositive(Number num1, Number num2) {
    int surplus = 0;
    Number result = Number(array: [], isNegative: false);
    while (num1.array.isNotEmpty && num2.array.isNotEmpty) {
      int temp1 = num1.array.removeLast();
      int temp2 = num2.array.removeLast();
      int sum = temp1 + temp2 + surplus;
      if (sum >= 10) {
        surplus = 1;
        sum = sum - 10;
      } else {
        surplus = 0;
      }
      result.array.insert(0, sum);
    }
    Number numIsNotEmpty = _numStillNotEmpty(num1, num2);
    result = _sumSurplusWithNumber(numIsNotEmpty, surplus, result);
    return result;
  }

  Number _sumSurplusWithNumber(Number num, int surplus, Number result) {
    if (surplus != 0) {
      while (surplus != 0) {
        if (num.array.isNotEmpty) {
          int temp = num.array.removeLast();
          int sum = temp + surplus;
          if (sum >= 10) {
            surplus = 1;
            sum = sum - 10;
          } else {
            surplus = 0;
          }
          result.array.insert(0, sum);
        } else {
          result.array.insert(0, surplus);
          surplus = 0;
        }
      }
    } else {
      result.array = [...num.array, ...result.array];
    }
    return result;
  }

  sum(String input1, String input2) {
    Number num1 = convertStringToArrayNumber(input1);
    Number num2 = convertStringToArrayNumber(input2);
    Number? result;

    if (!num1.isNegative && !num2.isNegative) {
      //both positive
      Number result = _sumTwoNumberPositive(num1, num2);
      // int surplus = 0;
      // while (num1.array.isNotEmpty && num2.array.isNotEmpty) {
      //   int temp1 = num1.array.removeLast();
      //   int temp2 = num2.array.removeLast();
      //   int sum = temp1 + temp2 + surplus;
      //   if (sum >= 10) {
      //     surplus = 1;
      //     sum = sum - 10;
      //   } else {
      //     surplus = 0;
      //   }
      //   result.array.insert(0, sum);
      // }
      // Number numIsNotEmpty = _numStillNotEmpty(num1, num2);
      // if (surplus != 0) {
      //   while (surplus != 0) {
      //     if (numIsNotEmpty.array.isNotEmpty) {
      //       int temp = numIsNotEmpty.array.removeLast();
      //       int sum = temp + surplus;
      //       if (sum >= 10) {
      //         surplus = 1;
      //         sum = sum - 10;
      //       } else {
      //         surplus = 0;
      //       }
      //       result.array.insert(0, sum);
      //     } else {
      //       result.array.insert(0, surplus);
      //       surplus = 0;
      //     }
      //   }
      // } else {
      //   result.array = [...numIsNotEmpty.array, ...result.array];
      // }
    }

    print(result!.isNegative);
    print(result.array);
  }
}
