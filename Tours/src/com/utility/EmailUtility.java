package com.utility;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class EmailUtility {

	 public static int sendMail(String email,String country_list,String days,String person,String fprice,String total,String hotel_price) {  
		  
		 int i = 0;
		 String to=email;//change accordingly  
		  
		  
		  //Get the session object  
		  Properties props = new Properties();  
		  props.put("mail.smtp.host", "mail.kitecertification.com");  
		  props.put("mail.smtp.socketFactory.port", "25");  
		  //props.put("mail.smtp.socketFactory.class",  
		           // "javax.net.ssl.SSLSocketFactory");  
		  props.put("mail.smtp.auth", "true");  
		  props.put("mail.smtp.port", "25");  
		   
		  Session session = Session.getInstance(props,  
		   new javax.mail.Authenticator() {  
		   protected PasswordAuthentication getPasswordAuthentication() {  
		   return new PasswordAuthentication("info@kitecertification.com","oais2ehe");//change accordingly  
		   }  
		  });  
		   
		  //compose message  
		  try {  
		   MimeMessage message = new MimeMessage(session);  
		   message.setFrom(new InternetAddress("info@kitecertification.com"));//change accordingly  
		   message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
		   message.setSubject("Your Tour Package Quotation");  
		   message.setText("Countries\n\n" + country_list + "\n\n No. of Person(s): " + person
				   + "\n\n No. of days: " + days + "\n\n Hotel Charges[per day]: " + hotel_price + "\n\n Air Fare[per person, round trip, economy]: " + fprice + "\n\n Total Estimate: " + total
				   );  
		     
		   //send message  
		   Transport.send(message);  
		  
		   
		   
		  } catch (MessagingException e) {i=1;} 
		  	catch(Exception e){ i =1;}
		   
		  return i;
		   
		 }  
}
