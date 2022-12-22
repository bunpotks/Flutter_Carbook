import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carbook/components/custom_surfix_icon.dart';
import 'package:carbook/components/form_error.dart';
import 'package:carbook/helper/keyboard.dart';
import 'package:carbook/screens/forgot_password/forgot_password_screen.dart';
import 'package:carbook/screens/home/home_screen.dart';
import 'package:carbook/screens/login_success/login_success_screen.dart';
import 'package:carbook/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final formkey = GlobalKey<FormState>();
  String? email = '123';
  String? password;
  bool? remember = false;
  dynamic prefs = false;
  TextEditingController date = TextEditingController();

  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  initState() {
    super.initState();
    asyncMethod();
  }

  void asyncMethod() async {
    prefs = await SharedPreferences.getInstance();
  }

  getDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        // DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      // print(formattedDate);

      setState(() {
        date.text = formattedDate; //set output date to TextField value.
      });
    } else {
      print('close');
    }
  }

  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildDateFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  AppLocalizations.of(context)!.signin_forgot,
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: AppLocalizations.of(context)!.signin_continue,
            press: () async {
              await prefs.setBool('is_logged_in', true);

              Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginSuccessScreen.routeName,
                  ((Route<dynamic> route) => false));

              // if (_formKey.currentState!.validate()) {
              //   _formKey.currentState!.save();
              //   // if all are valid then go to success screen
              //   KeyboardUtil.hideKeyboard(context);
              //   Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              // }
            },
          ),
        ],
      ),
    );
  }

  InkWell buildDateFormField() {
    return InkWell(
      onTap: () => {},
      child: TextFormField(
        controller: date,
        // obscureText: true,
        readOnly: true,
        onTap: () async => await getDate(),
        onSaved: (newValue) => password = newValue,
        onChanged: (value) {
          if (value.isNotEmpty) {
            removeError(error: kPassNullError);
          } else if (value.length >= 8) {
            removeError(error: kShortPassError);
          }
          return null;
        },
        validator: (value) {
          if (value!.isEmpty) {
            addError(error: kPassNullError);
            return "";
          } else if (value.length < 8) {
            addError(error: kShortPassError);
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.signin_input_date,
          hintText: AppLocalizations.of(context)!.signin_input_date_placeholder,
          // If  you are using latest version of flutter then lable text and hint text shown like this
          // if you r using flutter less then 1.20.* then maybe this is not working properly
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.date_range,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.signin_input_password,
        hintText:
            AppLocalizations.of(context)!.signin_input_password_placeholder,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      // controller: TextEditingController()..text,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      // initialValue: email,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.signin_input_email,
        hintText: AppLocalizations.of(context)!.signin_input_email_placeholder,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
