<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.utility.EmailUtility" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String email=request.getParameter("email");
String country_list=request.getParameter("country_list");
String days=request.getParameter("days");
String person=request.getParameter("person");
String fprice=request.getParameter("fprice");
String hotel_price=request.getParameter("hotel_price");
String total=request.getParameter("total");

//send an email to i.hirani@techskllsit.com 
int i  = EmailUtility.sendMail(email,country_list,days,person,fprice,total,hotel_price);
if(i == 0){
%>
<p>Thank you for reaching out to us. <BR><BR>
													We have Sent you your Estimate <BR>
													Please feel free to contact us for any futher assistance
													<BR>
													contact Info goes here
													<BR>
													MyTour.com
													
													 </p>
<%	
}
else{
	%>
	<p>We could not reach out to your email server. <BR><BR>
													This could be due to incorrect email address or slow internet connection. 
													<BR>
													You can try emailing the estimate again.. 
													<BR> 
													Admin, <BR>
													MyTour.com
													
													 </p>
	<%
}
%>

</body>
</html>