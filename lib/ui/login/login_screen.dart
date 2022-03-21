import 'dart:async';

import 'package:distance_run_tracker/store/login/login_store.dart';
import 'package:distance_run_tracker/ui/constants/strings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/device/device_utils.dart';
import '../common/_common_widgets.dart';
import '../common/error_message_widget.dart';
import '../constants/theme.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = UIStringConstants.loginScreenId;

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginStore _store;
  final TextEditingController _nameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _store = Provider.of<LoginStore>(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: const EmptyAppBarWidget(),
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
                return _store.isLoggedIn
                    ? _navigateToHomeScreen(context)
                    : ErrorMessage(message: _store.errorStore.errorMessage, context: context,);
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
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildLogo(),
              const SizedBox(height: 16.0),
              const Text('Enter a name to start'),
              const SizedBox(height: 8.0),
              Column(
                children: [
                  _buildNameAddressField(),
                  const SizedBox(height: 16.0),
                ],
              ),
              _buildSubmitButton('Start'),
            ],
          )
        ),
      ),
    );
  }

  Widget _buildLogo(){
    return Column(
      children: [
        Icon(Icons.directions_run, color: AppColors.primaryColor, size: MediaQuery.of(context).size.width/1.5,),
        const TitleTextWidget(title: UIStringConstants.appTitle),
      ],
    );
  }

  Widget _buildNameAddressField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint: 'Name',
          inputType: TextInputType.name,
          textController: _nameController,
          inputAction: TextInputAction.next,
          autoFocus: false,
          onChanged: (value) {
            _store.setName(_nameController.text);
          },
          errorText: _store.validate ? _store.formErrorStore.name : null,
        );
      }
    );
  }


  Widget _buildSubmitButton(String label) {
    return RoundedButtonWidget(
        buttonText: label,
        buttonColor: AppColors.primaryColor,
        textColor: Colors.white,
        onPressed: () async {
          DeviceUtils.hideKeyboard(context);
          _store.signInAnonymously();
        }
    );
  }


  Widget _navigateToHomeScreen(BuildContext context) {
    Future.delayed(Duration.zero, () async{
      Navigator.of(context).pushNamedAndRemoveUntil(
          HomeScreen.id, (Route<dynamic> route) => false);
    });
    _store.isLoggedIn = false;
    return const SizedBox.shrink();
  }


  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
