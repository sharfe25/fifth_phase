/// A model class representing a user.
///
/// This class encapsulates the basic information related to a user,
/// including their name, last name, email, username, and password.
class UserModel {
  /// The first name of the user.
  final String name;

  /// The last name of the user.
  final String lastName;

  /// The email address of the user.
  final String email;

  /// The password of the user.
  final String password;

  /// The username of the user.
  final String username;

  /// Constructs a [UserModel] with the given parameters.
  ///
  /// [name], [lastName], [email] are optional and default to an empty string.
  /// [username] and [password] are required.
  const UserModel({
    this.name = '',
    this.lastName = '',
    this.email = '',
    required this.username,
    required this.password,
  });

  /// Factory method to create an empty instance of [UserModel].
  ///
  /// This method returns a [UserModel] with all fields initialized to empty strings.
  factory UserModel.empty() {
    return const UserModel(
        username: '', name: '', lastName: '', email: '', password: '');
  }
}
