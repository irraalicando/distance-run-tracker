// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$distanceInKmAtom = Atom(name: '_HomeStore.distanceInKm');

  @override
  double get distanceInKm {
    _$distanceInKmAtom.reportRead();
    return super.distanceInKm;
  }

  @override
  set distanceInKm(double value) {
    _$distanceInKmAtom.reportWrite(value, super.distanceInKm, () {
      super.distanceInKm = value;
    });
  }

  final _$distanceListStreamAtom = Atom(name: '_HomeStore.distanceListStream');

  @override
  Stream<QuerySnapshot<Object?>>? get distanceListStream {
    _$distanceListStreamAtom.reportRead();
    return super.distanceListStream;
  }

  @override
  set distanceListStream(Stream<QuerySnapshot<Object?>>? value) {
    _$distanceListStreamAtom.reportWrite(value, super.distanceListStream, () {
      super.distanceListStream = value;
    });
  }

  final _$selectedDistanceAtom = Atom(name: '_HomeStore.selectedDistance');

  @override
  Distance? get selectedDistance {
    _$selectedDistanceAtom.reportRead();
    return super.selectedDistance;
  }

  @override
  set selectedDistance(Distance? value) {
    _$selectedDistanceAtom.reportWrite(value, super.selectedDistance, () {
      super.selectedDistance = value;
    });
  }

  final _$userAtom = Atom(name: '_HomeStore.user');

  @override
  String get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(String value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$showAllAtom = Atom(name: '_HomeStore.showAll');

  @override
  bool get showAll {
    _$showAllAtom.reportRead();
    return super.showAll;
  }

  @override
  set showAll(bool value) {
    _$showAllAtom.reportWrite(value, super.showAll, () {
      super.showAll = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeStore.loading');

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

  final _$isEditingAtom = Atom(name: '_HomeStore.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$signOutAsyncAction = AsyncAction('_HomeStore.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  final _$submitDistanceAsyncAction = AsyncAction('_HomeStore.submitDistance');

  @override
  Future<bool> submitDistance(String distanceInKm) {
    return _$submitDistanceAsyncAction
        .run(() => super.submitDistance(distanceInKm));
  }

  final _$updateDistanceAsyncAction = AsyncAction('_HomeStore.updateDistance');

  @override
  Future<bool> updateDistance(String newDistanceInKm) {
    return _$updateDistanceAsyncAction
        .run(() => super.updateDistance(newDistanceInKm));
  }

  final _$deleteEntryAsyncAction = AsyncAction('_HomeStore.deleteEntry');

  @override
  Future<bool> deleteEntry(Distance distance) {
    return _$deleteEntryAsyncAction.run(() => super.deleteEntry(distance));
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void toggleShowAll() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.toggleShowAll');
    try {
      return super.toggleShowAll();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEditingTrue(Distance distance) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setIsEditingTrue');
    try {
      return super.setIsEditingTrue(distance);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEditingFalse() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setIsEditingFalse');
    try {
      return super.setIsEditingFalse();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getDistanceListStream() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getDistanceListStream');
    try {
      return super.getDistanceListStream();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Stream<QuerySnapshot<Object?>> getUsersDistanceListStream() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getUsersDistanceListStream');
    try {
      return super.getUsersDistanceListStream();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dispose() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
distanceInKm: ${distanceInKm},
distanceListStream: ${distanceListStream},
selectedDistance: ${selectedDistance},
user: ${user},
showAll: ${showAll},
loading: ${loading},
isEditing: ${isEditing}
    ''';
  }
}
