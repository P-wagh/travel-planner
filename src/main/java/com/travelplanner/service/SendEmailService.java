package com.travelplanner.service;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

@Service
public class SendEmailService {

    public boolean sendEmail(String message, String subject, String to){

        boolean f = false;

        String from = "YOUR EMAIL";

        //variable for gamil host
        String host = "smtp.gmail.com";

        // System properties
        Properties properties = System.getProperties();
        System.out.println("system properties: "+ properties);

        // setting importent information in properties
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // step 1: to get the session object
        Session session = Session.getInstance(properties, new Authenticator() {

            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                
                return new PasswordAuthentication("YOUR EMAIL", "YOUR EMAIL PASSWOED");
            }
            
        });

        session.setDebug(true);

        // step 2: Cmpose the message (text, multimidia)
        
       MimeMessage m =  new MimeMessage(session);

       try {
           
           // from email id
            m.setFrom(from);

            // adding recipent to message
            m.addRecipient(Message.RecipientType.TO, new InternetAddress((to)));

            // adding subjet to message
            m.setSubject(subject);

            // adding text to message
            // m.setText(message);
            m.setContent(message,"text/html");

            // step 3: send the message using transport
            Transport.send(m);
            System.out.println("send msg success.......");
            f = true;

        } catch (MessagingException e) {

            e.printStackTrace();

        }

        return f;
    }

}
