import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';

import 'constants/error_constants.dart';


class ErrorUtil {
  static String handleError(dynamic error) {
    String errorDescription = '';
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case ErrorConstants.userNotFound:
          errorDescription = ErrorConstants.userNotFoundError;
          break;
        case ErrorConstants.invalidCredential:
          errorDescription = ErrorConstants.invalidCredentialError;
          break;
        case ErrorConstants.emailAlreadyInUse:
          errorDescription = ErrorConstants.emailAlreadyInUseError;
          break;
        case ErrorConstants.wrongPassword:
          errorDescription = ErrorConstants.invalidCredentialError;
          break;
        case ErrorConstants.networkError:
          errorDescription = ErrorConstants.networkError;
          break;
        default:
          errorDescription = ErrorConstants.generalError;
        break;
      }
    }else if (error is SocketException){
      errorDescription = ErrorConstants.networkError;
    }
    else if (error is String) {
      errorDescription = error;
    } else {
      errorDescription = ErrorConstants.generalError;
    }
    return errorDescription;
  }
}