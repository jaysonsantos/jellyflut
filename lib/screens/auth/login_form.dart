import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jellyflut/components/gradient_button.dart';
import 'package:jellyflut/components/locale_button_selector.dart';
import 'package:jellyflut/screens/auth/bloc/auth_bloc.dart';
import 'package:jellyflut/screens/auth/components/fields.dart';
import 'package:jellyflut/shared/extensions/enum_extensions.dart';
import 'package:jellyflut/shared/extensions/string_extensions.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'components/theme/input_theme.dart';
import 'enum/fields_enum.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback? onAuthenticated;

  LoginForm({Key? key, this.onAuthenticated}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final AuthBloc authBloc;
  FormGroup buildForm() => fb.group(<String, Object>{
        FieldsType.USER_USERNAME.getValue(): FormControl<String>(
          value: authBloc.username ?? '',
          validators: [Validators.required],
        ),
        FieldsType.USER_PASSWORD.getValue(): FormControl<String>(
          value: authBloc.userPassword ?? '',
          validators: [Validators.required],
        )
      });

  @override
  void initState() {
    super.initState();
    authBloc = BlocProvider.of<AuthBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: buildForm,
        builder: (context, form, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 38),
              Row(children: [
                Text('connection'.tr(),
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Spacer(),
                LocaleButtonSelector(
                    foregroundColor: Colors.black, showCurrentValue: true)
              ]),
              const SizedBox(height: 12),
              UserUsernameField(
                  form: form,
                  onSubmitted: () =>
                      form.focus(FieldsType.USER_PASSWORD.toString())),
              const SizedBox(height: 12),
              UserPasswordField(
                  form: form, onSubmitted: () => addUser(form, context)),
              const SizedBox(height: 24),
              actions(children: [
                backButton(form, context),
                const SizedBox(width: 12),
                loginButton(form, context)
              ]),
              const SizedBox(height: 24)
            ],
          );
        });
  }

  Widget actions({required List<Widget> children}) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: children);
  }

  Widget backButton(FormGroup form, BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
          onPressed: () => backToFirstForm(form, context),
          style: TextButton.styleFrom(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  backgroundColor: Colors.white)
              .copyWith(side: buttonBorderSide())
              .copyWith(elevation: buttonElevation()),
          child: Row(children: [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            Text(
              'previous'.tr(),
              style: TextStyle(color: Colors.black),
            ),
          ])),
    );
  }

  void backToFirstForm(FormGroup form, BuildContext context) {
    final username = form.value[FieldsType.USER_USERNAME.getValue()].toString();
    final password = form.value[FieldsType.USER_PASSWORD.getValue()].toString();
    authBloc.userPassword = password;
    authBloc.username = username;
    authBloc.add(BackToFirstForm());
  }

  Widget loginButton(FormGroup form, BuildContext context) {
    return Expanded(
      child: BlocConsumer<AuthBloc, AuthState>(
        bloc: authBloc,
        listener: (c, a) => {},
        builder: (context, state) {
          if (state is AuthenticationInProgress) {
            return GradienButton('', () => {},
                borderRadius: 4,
                enabled: false,
                color1: Colors.grey.shade400.withAlpha(220),
                color2: Colors.grey.shade500.withAlpha(230),
                child: CircularProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Theme.of(context).colorScheme.secondary));
          } else {
            return GradienButton('login'.tr(), () => addUser(form, context),
                borderRadius: 4);
          }
        },
      ),
    );
  }

  void addUser(FormGroup form, BuildContext context) {
    if (form.valid) {
      final username =
          form.value[FieldsType.USER_USERNAME.getValue()].toString();
      final password =
          form.value[FieldsType.USER_PASSWORD.getValue()].toString();
      authBloc.add(RequestAuth(username: username, password: password));
    } else {
      form.markAllAsTouched();
      final regexp = RegExp(r'^[^_]+(?=_)');
      final errors = <String>[];
      form.errors.forEach((key, value) {
        final fieldName =
            key.replaceAll(regexp, '').replaceAll('_', '').capitalize();
        errors.add('field_required'.tr(args: [fieldName]));
      });
      authBloc
          .add(AuthError('form_not_valid'.tr() + '\n${errors.join(',\n')}'));
    }
  }
}
