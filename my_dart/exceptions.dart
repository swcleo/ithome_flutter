class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}

class LogicalException implements Exception {
  String _cause = "打我啊笨蛋";

  toString() {
    return "LogicalException: $_cause";
  }
}

somethingWillThrowError(type) {
  switch (type) {
    case 0:
      throw CustomException("Sing Hosanna");
    case 1:
      throw LogicalException();
    default:
      throw "Unknown Error";
  }
}

void test() {
  try {
    somethingWillThrowError(DateTime.now().microsecondsSinceEpoch % 3);
  } on CustomException {
    print("🎵 He's got the whole world in His hands~");
  } on Exception catch (e) {
    // 取得Exception類型的錯誤
    print('Exception: ${e}');
    rethrow;
  } catch (e) {
    // 取得未知類型的錯誤
    print("$e");
  }
}

void main() {
  try {
    test();
  } on LogicalException catch (e) {
    print(e.runtimeType); // LogicalException
    print(e.toString());
  } finally {
    print("I Got You!!!");
  }
}
