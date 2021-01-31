class FirebaseErrorType {
  String errorMessage;

  FirebaseErrorType(
    this.errorMessage,
  );
}

class FirebaseEmailError extends FirebaseErrorType {
  FirebaseEmailError(errorMessage) : super(errorMessage);
}

class FirebasePasswordError extends FirebaseErrorType {
  FirebasePasswordError(errorMessage) : super(errorMessage);
}

class FirebaseOtherError extends FirebaseErrorType {
  FirebaseOtherError(errorMessage) : super(errorMessage);
}
