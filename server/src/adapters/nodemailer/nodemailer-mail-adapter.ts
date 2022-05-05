import nodemailer from 'nodemailer';
import { MailAdapter, SendMailData } from "../mail-adapter";

const transport = nodemailer.createTransport({
  host: "smtp.mailtrap.io",
  port: 2525,
  auth: {
    user: "582c66914bf0d5",
    pass: "0b5fdd429983c0"
  }
});

export class NodemailerMailAdapter implements MailAdapter {
  async sendMail({subject, body}: SendMailData){
    await transport.sendMail({
      from: "Equipe Feedget <oi@feedget.com>",
      to: "Rodrigo Moraes <rodrigomoraes61@outlook.com>",
      subject,
      html: body
    })
  };
}