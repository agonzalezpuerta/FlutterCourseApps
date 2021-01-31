import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/widgets/firebase_error_types.dart';

class AuthService {
  // Initialize the authentication token on class creation
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String errorCode;

  // Register users using email and password
  Future registerUser(String userEmail, String userPassword) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: userPassword);
      return _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      errorCode = e.code;
      return getMessageFromErrorCode();
    }
  }

  // Login users using email and password
  Future loginUser(String userEmail, String userPassword) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: userEmail, password: userPassword);
      return _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      errorCode = e.code;
      return getMessageFromErrorCode();
    }
  }

  // Logout users
  void logoutUser() {
    _auth.signOut();
  }

  User checkCurrentUser() {
    final currentUser = _auth.currentUser;
    return currentUser;
  }

  // Get message from error codes (Corentin Houdayer from stackoverflow)
  dynamic getMessageFromErrorCode() {
    print(this.errorCode);
    switch (this.errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return FirebaseEmailError("Email already used. Go to login page.");
        break;
      case "account-exists-with-different-credential":
        return FirebaseEmailError("Email already used. Go to login page.");
        break;
      case "email-already-in-use":
        return FirebaseEmailError("Email already used. Go to login page.");
        break;
      case "ERROR_WRONG_PASSWORD":
        return FirebasePasswordError("Invalid password.");
        break;
      case "wrong-password":
        return FirebasePasswordError("Invalid password.");
        break;
      case "weak-password":
        return FirebasePasswordError(
            "Weak password, please use at least six characters.");
        break;
      case "ERROR_USER_NOT_FOUND":
        return FirebaseOtherError("User not found.");
        break;
      case "user-not-found":
        return FirebaseOtherError("User not found.");
        break;
      case "ERROR_USER_DISABLED":
        return FirebaseOtherError("User disabled.");
        break;
      case "user-disabled":
        return FirebaseOtherError("User disabled.");
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        return FirebaseOtherError(
            "Too many requests to log into this account.");
        break;
      case "operation-not-allowed":
        return FirebaseOtherError(
            "Too many requests to log into this account.");
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        return FirebaseOtherError(
            "Too many requests to log into this account.");
        break;
      case "operation-not-allowed":
        return FirebaseOtherError("Server error, please try again later.");
        break;
      case "ERROR_INVALID_EMAIL":
        return FirebaseEmailError("Email address is invalid.");
        break;
      case "invalid-email":
        return FirebaseEmailError("Email address is invalid.");
        break;
      default:
        return FirebaseEmailError("Error. Please try again.");
        break;
    }
  }
}
