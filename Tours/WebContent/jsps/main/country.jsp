<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<BR>
Select locations you wish to Visit: <BR>
<% int i = 0; %>


<c:forEach var="c"  items="${list }"> 
<% i++; %>

<input type="checkbox" name="country[]" id="country[]" value="<c:out value="${c.getId() }"/>">
<c:out value="${c.getName() }"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<BR>

</c:forEach>

</body>
</html>