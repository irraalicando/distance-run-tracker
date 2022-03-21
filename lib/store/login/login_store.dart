
import 'package:mobx/mobx.dart';

import '../../data/network/auth_repository.dart';
import '../../utils/error/error_util.dart';
import '../error/error_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final FormErrorStore formErrorStore = FormErrorStore();
  final ErrorStore errorStore = ErrorStore();

  final AuthRepository _authRepo;

  // disposers
  late List<ReactionDisposer> _disposers;

  _LoginStore(AuthRepository authProviderRepository)
      : _authRepo = authProviderRepository {
    _setupValidations();
    _initStore();
  }

  void _setupValidations() {
    _disposers = [
      reaction((_) => name, formErrorStore.validateName),
    ];
  }

  Future<void> _initStore() async{
    var firebaseId = await _authRepo.getUserAuthId();

    isLoggedIn = firebaseId.isNotEmpty;
  }

  // store variables:-----------------------------------------------------------
  @observable
  String name = '';

  @observable
  String password = '';

  @observable
  bool isLoggedIn = false;

  @observable
  bool loading = false;

  @observable
  bool obscurePassword = true;

  @observable
  bool validate = true;

  @computed
  bool get canLogin => name.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setName(String value) {
    validate = true;
    name = value;
  }

  @action
  void setPassword(String value) {
    validate = true;
    password = value;
  }

  @action
  void toggleObscurePasswordText() {
    obscurePassword = !obscurePassword;
  }



  @action
  void clearErrorsAndValues() {
    validate = false;
    name = '';
    formErrorStore.name = null;
  }


  @action
  Future signInAnonymously() async {
    loading = true;
    isLoggedIn = await _authRepo.signInAnonymously(name).
                onError((error, stackTrace){
                  errorStore.errorMessage = ErrorUtil.handleError(error);
                  return false;
                });
    loading = false;
  }

  void validateAll() {
    formErrorStore.validateName(name);
  }

  // dispose:-------------------------------------------------------------------
  @action
  dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? name;

  @computed
  bool get hasErrorInForgotPassword => name != null;

  @action
  void validateName(String value) {
    if (value.isEmpty) {
      name = "Please enter a name";
    } else {
      name = null;
    }
  }
}
