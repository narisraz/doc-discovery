import 'package:docdiscovery/core/providers.dart';
import 'package:docdiscovery/domain/usecases/sign_up_user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignUpButton extends ConsumerStatefulWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.isPasswordValid,
    required this.ref,
    required this.emaiController,
    required this.passwordController,
    required this.familyNameController,
    required this.givenNameController,
    required this.picture,
  });

  final GlobalKey<FormState> formKey;
  final bool isPasswordValid;
  final WidgetRef ref;
  final TextEditingController emaiController;
  final TextEditingController passwordController;
  final TextEditingController familyNameController;
  final TextEditingController givenNameController;
  final String picture;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends ConsumerState<SignUpButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      key: const Key("signup"),
      onPressed: () {
        if ((widget.formKey.currentState?.validate() ?? false) &&
            widget.isPasswordValid) {
          ref
              .read(signUpUserUseCaseProvider)
              .execute(
                SignUpUserRequest(
                  email: widget.emaiController.text,
                  password: widget.passwordController.text,
                  familyName: widget.familyNameController.text,
                  givenName: widget.givenNameController.text,
                  picture: widget.picture,
                ),
              )
              .then(
                (value) => value.fold(
                  (_) => setState(() => isLoading = false),
                  (_) => Navigator.of(context).popUntil(
                    (route) => route.isFirst,
                  ),
                ),
              );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Valider"),
          const Gap(16),
          if (isLoading)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            )
        ],
      ),
    );
  }
}
