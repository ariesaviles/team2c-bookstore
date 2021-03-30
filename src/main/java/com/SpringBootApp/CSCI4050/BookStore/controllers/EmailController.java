package com.SpringBootApp.CSCI4050.BookStore.controllers;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.*;
import javax.mail.internet.*;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

public class EmailController {
    @RequestMapping(value = "/sendemail")
    public String sendEmail() throws IOException,MessagingException,AddressException {

        return "Email was sent successfully";
    }
    private void sendmail() throws AddressException, MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");


        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("tutorialspoint@gmail.com", "<your password>");
            }
        });

        /*SimpleMailMessage msg = new SimpleMailMessage();*/
        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress("company email", false));

        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse("user email"));
        msg.setSubject("Subject");
        msg.setContent("Content", "text/html");
        msg.setSentDate(new Date());

        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent("Body Content", "text/html");

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        MimeBodyPart attachPart = new MimeBodyPart();

        attachPart.attachFile("pic file path");
        multipart.addBodyPart(attachPart);
        msg.setContent(multipart);
        Transport.send(msg);
    }

}
