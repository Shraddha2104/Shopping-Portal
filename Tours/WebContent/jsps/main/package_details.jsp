<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
nav ul li{
font-weight: bold;
display: inline; 

}

</style>
</head>
<body>
<c:import url="../../header.jsp"></c:import>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" user="root" password="" 
url="jdbc:mysql://localhost:3306/tour" />

<sql:query dataSource="${ds}" var="result">
SELECT * from package,images where package.id  = images.package_id && id='<c:out value="${pac_id }"/>'
</sql:query>  

<%
int i=1;
%>

 <section id="faculity-member" class="section-padding">
      <div class="container" id="packages">
        <div class="row">
  <nav>
<ul>

<c:forEach var="row" items="${result.rows }">
<% if(i == 1){ %>
<h1><c:out value="${row.pname }"/> </h1>
<h4>Price: Rs. <c:out value="${row.price }"/> </h4>
<c:out value="${row.details }" escapeXml=""></c:out><BR>
<%  i++ ; 
} %>

<li><img src="<c:out value="${row.name }"/>" width="200" height="150"/></li> 
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

</c:forEach>

</ul>
<button class="btn btn-primary">Book the Tour</button>
</nav> 

</div>
</div>
</section>

</body>
</html>