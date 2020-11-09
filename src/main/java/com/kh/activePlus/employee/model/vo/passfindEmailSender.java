package com.kh.activePlus.employee.model.vo;

import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


@Service
public class passfindEmailSender{
	
	@Autowired
    protected JavaMailSender mailSender;
    public void SendEmail(passfindEmail email) throws Exception {
         
    	MimeMessage msg = mailSender.createMimeMessage();
        try {
        	MimeMessageHelper helper = new MimeMessageHelper(msg);
        	helper.setFrom("gjgjgjdudgus@gmail.com");
        	helper.setTo(email.getReceiver());
        	helper.setText(email.getContent());
        	helper.setSubject(email.getSubject());
        	/*
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO ,
            		InternetAddress.parse(email.getReceiver()));
        	*/
            
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        try {
            mailSender.send(msg);
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
    }
	
}

