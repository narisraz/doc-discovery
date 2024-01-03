import 'package:email_validator/email_validator.dart';

class MailUtil {
  bool isValid(String email) {
    return EmailValidator.validate(email);
  }
}
