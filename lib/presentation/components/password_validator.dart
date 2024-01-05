import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class PasswordValidator extends StatefulWidget {
  final TextEditingController controller;
  final Function(bool) onChange;
  final int? minLength;
  final int? minSpecialCharacters;
  final int? minUppercaseCharacters;
  final int? minLowercaseCharacters;
  final int? minNumericCharacters;

  const PasswordValidator({
    super.key,
    required this.controller,
    required this.onChange,
    this.minLength = 8,
    this.minSpecialCharacters = 1,
    this.minUppercaseCharacters = 1,
    this.minLowercaseCharacters = 1,
    this.minNumericCharacters = 1,
  });

  @override
  State<PasswordValidator> createState() => _PasswordValidatorState();
}

class _PasswordValidatorState extends State<PasswordValidator> {
  bool isPasswordValid = true;
  bool validLength = false;
  bool validSpecialCharacters = false;
  bool validUppercaseCharacters = false;
  bool validLowercaseCharacters = false;
  bool validNumericCharacters = false;

  valueChanges() {
    final value = widget.controller.text;
    setState(() {
      validLength = value.length >= widget.minLength!;
      validSpecialCharacters =
          RegExp(r'^(.*[!@#\$&*.,?^~].*)$').hasMatch(value);
      validNumericCharacters = RegExp(r'^(.*[0-9].*)$').hasMatch(value);
      validLowercaseCharacters = RegExp(r'^(.*[a-z].*)$').hasMatch(value);
      validUppercaseCharacters = RegExp(r'^(.*[A-Z].*)$').hasMatch(value);
      isPasswordValid = validLength &&
          validSpecialCharacters &&
          validNumericCharacters &&
          validUppercaseCharacters &&
          validLowercaseCharacters;
    });
    widget.onChange(isPasswordValid);
  }

  @override
  Widget build(BuildContext context) {
    Color validColor = Theme.of(context).colorScheme.primary;
    Color invalidColor = Theme.of(context).colorScheme.error;

    widget.controller.addListener(valueChanges);

    return (isPasswordValid)
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: 100.milliseconds,
                        height: 5,
                        decoration: BoxDecoration(
                          color: [
                            validLength,
                            validSpecialCharacters,
                            validNumericCharacters,
                            validUppercaseCharacters,
                            validLowercaseCharacters
                          ].where((element) => element == true).isNotEmpty
                              ? validColor
                              : invalidColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    const Gap(4),
                    Expanded(
                      child: AnimatedContainer(
                        duration: 100.milliseconds,
                        height: 5,
                        decoration: BoxDecoration(
                          color: [
                                    validLength,
                                    validSpecialCharacters,
                                    validNumericCharacters,
                                    validUppercaseCharacters,
                                    validLowercaseCharacters
                                  ]
                                      .where((element) => element == true)
                                      .length >=
                                  2
                              ? validColor
                              : invalidColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    const Gap(4),
                    Expanded(
                      child: AnimatedContainer(
                        duration: 100.milliseconds,
                        height: 5,
                        decoration: BoxDecoration(
                          color: [
                                    validLength,
                                    validSpecialCharacters,
                                    validNumericCharacters,
                                    validUppercaseCharacters,
                                    validLowercaseCharacters
                                  ]
                                      .where((element) => element == true)
                                      .length >=
                                  3
                              ? validColor
                              : invalidColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    const Gap(4),
                    Expanded(
                      child: AnimatedContainer(
                        duration: 100.milliseconds,
                        height: 5,
                        decoration: BoxDecoration(
                          color: [
                                    validLength,
                                    validSpecialCharacters,
                                    validNumericCharacters,
                                    validUppercaseCharacters,
                                    validLowercaseCharacters
                                  ]
                                      .where((element) => element == true)
                                      .length >=
                                  4
                              ? validColor
                              : invalidColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                    const Gap(4),
                    Expanded(
                      child: AnimatedContainer(
                        duration: 100.milliseconds,
                        height: 5,
                        decoration: BoxDecoration(
                          color: [
                                    validLength,
                                    validSpecialCharacters,
                                    validNumericCharacters,
                                    validUppercaseCharacters,
                                    validLowercaseCharacters
                                  ]
                                      .where((element) => element == true)
                                      .length >=
                                  5
                              ? validColor
                              : invalidColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(4),
                Row(children: [
                  Icon(
                    validLength ? Icons.check : Icons.close,
                    color: validLength ? validColor : invalidColor,
                  ),
                  Text(
                    "Au moin ${widget.minLength} caractères",
                    style: TextStyle(
                      color: validSpecialCharacters ? validColor : invalidColor,
                    ),
                  )
                ]),
                Row(children: [
                  Icon(
                    validSpecialCharacters ? Icons.check : Icons.close,
                    color: validSpecialCharacters ? validColor : invalidColor,
                  ),
                  Text(
                    "Au moin ${widget.minSpecialCharacters} caractères spéciaux",
                    style: TextStyle(
                      color: validSpecialCharacters ? validColor : invalidColor,
                    ),
                  )
                ]),
                Row(children: [
                  Icon(
                    validNumericCharacters ? Icons.check : Icons.close,
                    color: validNumericCharacters ? validColor : invalidColor,
                  ),
                  Text(
                    "Au moin ${widget.minNumericCharacters} caractères numériques",
                    style: TextStyle(
                      color: validSpecialCharacters ? validColor : invalidColor,
                    ),
                  )
                ]),
                Row(children: [
                  Icon(
                    validUppercaseCharacters ? Icons.check : Icons.close,
                    color: validUppercaseCharacters ? validColor : invalidColor,
                  ),
                  Text(
                    "Au moin ${widget.minUppercaseCharacters} lettres majuscules",
                    style: TextStyle(
                      color: validSpecialCharacters ? validColor : invalidColor,
                    ),
                  )
                ]),
                Row(children: [
                  Icon(
                    validLowercaseCharacters ? Icons.check : Icons.close,
                    color: validLowercaseCharacters ? validColor : invalidColor,
                  ),
                  Text(
                    "Au moin ${widget.minLowercaseCharacters} lettres minuscules",
                    style: TextStyle(
                      color: validSpecialCharacters ? validColor : invalidColor,
                    ),
                  )
                ]),
              ],
            ),
          );
  }
}
