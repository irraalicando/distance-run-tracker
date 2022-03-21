import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:distance_run_tracker/data/network/auth_repository.dart';
import 'package:distance_run_tracker/data/network/distance_repository.dart';
import 'package:distance_run_tracker/model/distance.dart';
import 'package:mobx/mobx.dart';

import '../../utils/error/error_util.dart';
import '../error/error_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  final ErrorStore errorStore = ErrorStore();

  final DistanceRepository _distanceRepository;
  final AuthRepository _authRepository;


  late List<ReactionDisposer> _disposers;

  _HomeStore(
      DistanceRepository distanceRepository,
      AuthRepository authRepository,)
      : _distanceRepository = distanceRepository,
        _authRepository = authRepository;

  // store variables:-----------------------------------------------------------


  @observable
  double distanceInKm = 0.0;

  @observable
  Stream<QuerySnapshot>? distanceListStream;

  @observable
  Distance? selectedDistance;

  @observable
  String user = '-';

  @observable
  bool showAll = false;

  @observable
  bool loading = false;

  @observable
  bool isEditing = false;

  // actions:-------------------------------------------------------------------

  Future<void> initStore() async{
    user = await _authRepository.getUserAuthId();
    distanceListStream = getUsersDistanceListStream();
    showAll = false;
  }

  @action
  Future<void> signOut() async{
    loading = true;
    await _authRepository.handleSignOut()
        .onError((error, stackTrace) {
      errorStore.errorMessage = ErrorUtil.handleError(error);
    });
    loading = false;
  }

  @action
  void toggleShowAll(){
    showAll = !showAll;
    distanceListStream = showAll ? getDistanceListStream() : getUsersDistanceListStream();
  }

  @action
  void setIsEditingTrue(Distance distance){
    selectedDistance = distance;
    isEditing = true;
  }

  @action
  void setIsEditingFalse(){
    selectedDistance = null;
    isEditing = false;
  }

  @action
  Stream<QuerySnapshot> getDistanceListStream() {
    return _distanceRepository.getAllDistanceListStream()
        .handleError((error){
          errorStore.errorMessage = ErrorUtil.handleError(error);
        });
  }

  @action
  Stream<QuerySnapshot> getUsersDistanceListStream() {
    return _distanceRepository.getUsersDistanceListStream(user)
        .handleError((error){
          errorStore.errorMessage = ErrorUtil.handleError(error);
        });
  }

  @action
  Future<bool> submitDistance(String distanceInKm) async{
    var result = true;
    if(distanceInKm.isNotEmpty){
      var distanceInKmDouble = double.parse(distanceInKm);
      Distance distance = Distance(distanceInKm: distanceInKmDouble, timestamp: DateTime.now().millisecondsSinceEpoch, user: user);
      result = await _distanceRepository.submitDistance(distance).
      onError((error, stackTrace){
        errorStore.errorMessage = ErrorUtil.handleError(error);
        return false;
      });
    } else{
      errorStore.errorMessage = ErrorUtil.handleError('Please enter a valid value.');
      result = false;
    }
    return result;
  }

  @action
  Future<bool> updateDistance(String newDistanceInKm) async{
    var result = true;
    if(newDistanceInKm.isNotEmpty){
      selectedDistance?.distanceInKm = double.parse(newDistanceInKm);
      await _distanceRepository.updateDistance(selectedDistance!).
      catchError((error, stackTrace){
        errorStore.errorMessage = ErrorUtil.handleError(error);
        result = false;
      });

    } else{
      errorStore.errorMessage = ErrorUtil.handleError('Please enter a valid value.');
      result = false;
    }
    return result;
  }

  @action
  Future<bool> deleteEntry(Distance distance) async{
    var result = true;
    await _distanceRepository.deleteEntry(distance).
      catchError((error, stackTrace){
        errorStore.errorMessage = ErrorUtil.handleError(error);
        result = false;
      });
    return result;
  }


  // dispose:-------------------------------------------------------------------
  @action
  dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
