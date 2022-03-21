import 'dart:async';

import 'package:distance_run_tracker/ui/constants/strings.dart';
import 'package:distance_run_tracker/utils/device/datetime_utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../model/distance.dart';
import '../../store/home/home_store.dart';
import '../../utils/device/device_utils.dart';
import '../common/_common_widgets.dart';
import '../common/error_message_widget.dart';
import '../constants/theme.dart';
import '../login/login_screen.dart';
import 'distance_list_widget.dart';

class HomeScreen extends StatefulWidget {
  static String id = UiStringConstants.homeScreenId;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeStore _store;

  final TextEditingController _distanceInKmTextController =
      TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store = Provider.of<HomeStore>(context);
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      _store.initStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: AppBar(
        title: const Text(UiStringConstants.appTitle),
        actions: [
          IconButton(
              onPressed: () {
                _showSignOutAlertDialog(context: context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return GestureDetector(
      onTap: () => DeviceUtils.hideKeyboard(context),
      child: Material(
        child: Stack(
          children: <Widget>[
            _buildMainContent(),
            Observer(
              builder: (context) {
                return ErrorMessage(
                  message: _store.errorStore.errorMessage,
                  context: context,
                );
              },
            ),
            Observer(
              builder: (context) {
                return Visibility(
                  visible: _store.loading,
                  child: const CustomProgressIndicatorWidget(),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleWidget(),
                      _buildDistanceInKmField(),
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          _store.showAll
                              ? 'Everyone\'s run distances'
                              : 'Your run distances',
                          style: AppText.subTitleStyle),
                      PopupMenuButton(
                        child: const Icon(Icons.settings),
                        itemBuilder: (context) {
                          return List.generate(1, (index) {
                            return PopupMenuItem(
                              child: Text(_store.showAll
                                  ? 'Show your distances'
                                  : 'Show everyone\'s distances'),
                              onTap: () => _store.toggleShowAll(),
                            );
                          });
                        },
                      )
                    ],
                  ),
                );
              }),
              Observer(builder: (context) {
                return DistanceListWidget(
                  distanceListStream: _store.distanceListStream,
                  isShowAll: _store.showAll,
                  isEditing: _store.isEditing,
                  delete: _store.deleteEntry,
                  edit: (Distance distance) {
                    _store.setIsEditingTrue(distance);
                    _distanceInKmTextController.text =
                        distance.distanceInKm.toString();
                  },
                  cancelEdit: () => _cancelEdit(),
                  selectedDistance: _store.selectedDistance,
                );
              })
            ],
          )),
    );
  }

  Widget _buildTitleWidget() {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
            _store.isEditing
                ? 'Update ${DateTimeUtils.getDateTimeFromTimeStamp(_store.selectedDistance!.timestamp)} distance'
                : 'Submit a run distance',
            style: AppText.subTitleStyle),
      );
    });
  }

  Widget _buildDistanceInKmField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFieldWidget(
        hint: 'Enter distance in kilometers',
        inputType: TextInputType.number,
        textController: _distanceInKmTextController,
        inputAction: TextInputAction.next,
        decimalOnly: true,
        autoFocus: false,
        onChanged: (value) {},
        errorText: null,
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Observer(builder: (context) {
      return Row(
        children: [
          Expanded(
            child: RoundedButtonWidget(
              buttonText: _store.isEditing ? 'Update' : 'Submit',
              buttonColor: AppColors.primaryColor,
              textColor: Colors.white,
              onPressed: () async {
                DeviceUtils.hideKeyboard(context);
                if (_store.isEditing) {
                  bool result = await _store
                      .updateDistance(_distanceInKmTextController.text);
                  if (result == true) {
                    _cancelEdit();
                  }
                } else {
                  _store.submitDistance(_distanceInKmTextController.text);
                }
                _distanceInKmTextController.text = '';
              },
            ),
          ),
          _store.isEditing
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: RoundedButtonWidget(
                      buttonText: 'Cancel',
                      buttonColor: Colors.white12,
                      textColor: Colors.white,
                      onPressed: () async {
                        DeviceUtils.hideKeyboard(context);
                        _cancelEdit();
                      },
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      );
    });
  }

  _showSignOutAlertDialog({required BuildContext context}) {
    Widget cancelButton = TextButton(
      child: Text("CANCEL",
          style: AppText.bodyStyle.copyWith(color: Colors.white)),
      style: TextButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
      onPressed: () => Navigator.pop(context),
    );

    Widget okButton = TextButton(
      child:
          Text("YES", style: AppText.bodyStyle.copyWith(color: Colors.white)),
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: () async {
        await _store.signOut();
        Future.delayed(Duration.zero, () async {
          Navigator.of(context).pushNamedAndRemoveUntil(
              LoginScreen.id, (Route<dynamic> route) => false);
        });
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Sign out"),
      content: const Text("Are you sure you want to sign out?"),
      buttonPadding: const EdgeInsets.all(16),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: okButton),
            const SizedBox(
              width: 8,
            ),
            Expanded(child: cancelButton),
          ],
        )
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _cancelEdit() {
    _store.setIsEditingFalse();
    _distanceInKmTextController.text = '';
  }

  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    super.dispose();
  }
}
