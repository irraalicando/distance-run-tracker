class ErrorConstants {
  ErrorConstants._();

  // Firebase Auth Error Constants --------------------------------------------------------------
  static const String userNotFound = "login-not-found";
  static const String invalidCredential = "invalid-credential";
  static const String networkError = "network-request-failed";
  static const String emailAlreadyInUse = "email-already-in-use";
  static const String wrongPassword = "wrong-password";
  static const String userCancelled = "login-cancelled";
  static const String userNotFoundError = "User does not exist. Sign up to create an account.";
  static const String invalidCredentialError = "Incorrect email and password combination.";
  static const String emailAlreadyInUseError = "The email address is already in use by another account.";


  // Common Error Constants --------------------------------------------------------------
  static const String generalError = "Something went wrong. Please try again.";
  static const String generalNetworkError = "Connection error. Please connect to a network.";
}