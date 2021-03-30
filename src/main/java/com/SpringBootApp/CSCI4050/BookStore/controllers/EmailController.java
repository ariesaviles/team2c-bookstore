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

    private void sendmail(String to, String from, String subject, String text) throws AddressException, MessagingException, IOException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");


        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("noreply@baeldung.com");
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        Transport.send(message);

    }

}
