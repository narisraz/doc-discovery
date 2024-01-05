import 'package:docdiscovery/core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SignInButton extends ConsumerStatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInButtonState();
}

class _SignInButtonState extends ConsumerState<SignInButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      key: const Key("signin-button"),
      onPressed: () {
        if (widget.formKey.currentState?.validate() ?? false) {
          setState(() => isLoading = true);
          ref
              .read(signInUserUseCaseProvider)
              .execute(
                widget.emailController.text,
                widget.passwordController.text,
              )
              .then(
                (value) => value.fold(
                  (_) {
                    setState(() => isLoading = false);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Adresse email ou mot de passe invalide",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onError),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ));
                  },
                  (_) => Navigator.of(context).pop(),
                ),
              );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Se connecter"),
          const Gap(16),
          if (isLoading)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(context).colorScheme.onPrimary,
                key: const Key("loading"),
              ),
            )
        ],
      ),
    );
  }
}
