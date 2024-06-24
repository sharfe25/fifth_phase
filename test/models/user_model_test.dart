import 'package:fifth_phase/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Cart product model test', () {
    test('Return a valid instance of the model', () {
      const UserModel issuePlace =
          UserModel(username: 'sharon', password: 'password');

      expect(issuePlace.username, equals('sharon'));
      expect(issuePlace.password, equals('password'));
    });

    test('Return a valid instance of the empty model', () {
      UserModel issuePlace = UserModel.empty();

      expect(issuePlace.username, equals(''));
      expect(issuePlace.password, equals(''));
    });
  });
}
