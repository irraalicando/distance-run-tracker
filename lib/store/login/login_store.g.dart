// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_LoginStore.canLogin'))
      .value;

  final _$nameAtom = Atom(name: '_LoginStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isLoggedInAtom = Atom(name: '_LoginStore.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$obscurePasswordAtom = Atom(name: '_LoginStore.obscurePassword');

  @override
  bool get obscurePassword {
    _$obscurePasswordAtom.reportRead();
    return super.obscurePassword;
  }

  @override
  set obscurePassword(bool value) {
    _$obscurePasswordAtom.reportWrite(value, super.obscurePassword, () {
      super.obscurePassword = value;
    });
  }

  final _$validateAtom = Atom(name: '_LoginStore.validate');

  @override
  bool get validate {
    _$validateAtom.reportRead();
    return super.validate;
  }

  @override
  set validate(bool value) {
    _$validateAtom.reportWrite(value, super.validate, () {
      super.validate = value;
    });
  }

  final _$signInAnonymouslyAsyncAction =
      AsyncAction('_LoginStore.signInAnonymously');

  @override
  Future<dynamic> signInAnonymously() {
    return _$signInAnonymouslyAsyncAction.run(() => super.signInAnonymously());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setName(String value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleObscurePasswordText() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.toggleObscurePasswordText');
    try {
      return super.toggleObscurePasswordText();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearErrorsAndValues() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.clearErrorsAndValues');
    try {
      return super.clearErrorsAndValues();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
password: ${password},
isLoggedIn: ${isLoggedIn},
loading: ${loading},
obscurePassword: ${obscurePassword},
validate: ${validate},
canLogin: ${canLogin}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_FormErrorStore.hasErrorInForgotPassword'))
      .value;

  final _$nameAtom = Atom(name: '_FormErrorStore.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$_FormErrorStoreActionController =
      ActionController(name: '_FormErrorStore');

  @override
  void validateName(String value) {
    final _$actionInfo = _$_FormErrorStoreActionController.startAction(
        name: '_FormErrorStore.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_FormErrorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
hasErrorInForgotPassword: ${hasErrorInForgotPassword}
    ''';
  }
}
