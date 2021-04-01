package com.SpringBootApp.CSCI4050.BookStore;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

public class Email {
    @RequestMapping(value = "/sendemail")
    public String sendEmail() throws IOException,MessagingException,AddressException {

        return "Email was sent successfully";
    }

    //private JavaMailSender sender;
    public void sendmail(String to, String subject, String text)  {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("team2cbookstore@gmail.com");
        mailSender.setPassword("team2cb00k");

        Properties properties = new Properties();
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");

        mailSender.setJavaMailProperties(properties);

        SimpleMailMessage msg = new SimpleMailMessage();

        msg.setFrom("team2cbookstore@gmail.com");
        msg.setTo(to);
        msg.setSubject(subject);
        msg.setText(text);

        mailSender.send(msg);


    }

}
