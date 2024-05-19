import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SendEmailService {
  final String username = 'hotrohoctap163@gmail.com'; // Thay bằng email của bạn
  final String password = 'wmep ymkk gifd cbdj'; // Thay bằng mật khẩu hoặc mật khẩu ứng dụng

  Future<void> sendEmail(String toEmail, String subject, String content) async {
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Nguyen Duc - Hotel')
      ..recipients.add(toEmail)
      ..subject = subject
      ..text = content;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. \n' + e.toString());
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}
