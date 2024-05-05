
  // final yandexSmtp =
  //     yandex(dotenv.env["YANDEX_EMAIL"]!, dotenv.env["YANDEX_PASSWORD"]!);

// sendMailFromYandex() async {
  //   final message = Message()
  //     ..from = Address(dotenv.env["YANDEX_EMAIL"]!, 'Confirmation Bot')
  //     ..recipients.add('yigivib607@wisnick.com')
  //     ..subject = 'This is just a test mail from yandex.'
  //     // ..text = 'This is the plain text.\nThis is line 2 of the text part.';
  //     ..html =
  //         '<body style="text-align: center; font-family: Tahoma, Geneva, Verdana, sans-serif;"> <div style="margin:auto; border-radius: 10px; width: 300px; padding: 10px; box-shadow: 1px 1px 1px 1px rgb(174, 174, 174);"> <img style="height: 150px;" src="https://static.vecteezy.com/system/resources/previews/018/930/122/non_2x/email-marketing-campaign-subscription-on-web-and-sending-email-newsletter-for-discount-or-promotion-information-businessmen-standing-next-to-email-envelope-announcing-promotion-through-megaphone-vector.jpg" alt="newsletter"> <h2>Thanks for accepting our Newsletter 🙌</h2> <p>Now you will never miss any updates.</p><p>Thanks for your support 😍</p></div></body>';

  //   try {
  //     final sendReport = await send(message, yandexSmtp);
  //     print('Message sent: ' + sendReport.toString());
  //   } on MailerException catch (e) {
  //     print('Message not sent.');
  //     for (var p in e.problems) {
  //       print('Problem: ${p.code}: ${p.msg}');
  //     }
  //   }
  // }