package com.SpringBootApp.CSCI4050.BookStore;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.*;
import javax.mail.internet.*;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

public class Email {
    @RequestMapping(value = "/sendemail")
    public String sendEmail() throws IOException,MessagingException,AddressException {

        return "Email was sent successfully";
    }

    private JavaMailSender sender;
    public void sendmail(String to, String subject, String text) throws AddressException, MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        MimeMessage message = sender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true);

        helper.setFrom("kruthika.uga@gmail.com");
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(text);


        sender.send(message);


    }

}
