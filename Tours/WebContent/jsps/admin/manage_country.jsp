<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<c:import url="../../header.jsp"/>
<!--Faculity member-->
<!-- Display of tour forms starts here -->
      
      
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/tour"
     user="root"  password=""/>

<sql:query dataSource="${ds}" var="result" >
select * from country
</sql:query>

    <section id ="tour1" class="section-padding">
      <div class="container" id="packages">
        <div class="row">
          <div class="alert alert-success fade in">
                                   <strong>Welcome</strong> Admin
           </div>     
          
      <table cellpadding="10" cellspacing="10">
      <tr>
      <td width="30%" valign="top"> 
      <a href="<%=request.getContextPath() %>/Admin?action=add_tour"> Add Tour Package</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=custom_package"> Check Custom Package Enquiries</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=edit_tour"> Edit/ Change Tour Packages</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=add_image"> Add image to Packages</a>
      <hr>
      <a href="<%=request.getContextPath() %>/Admin?action=add_country"> Add Country</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=manage_country"> Manage Country Listings</a>
      
      
      </td>
      <td align="center">
      
      <h2>All Country Listings</h2>
	<font color="red"><c:out value="${msg }"/></font> <BR>
      <c:forEach var="row" items="${result.rows }">
     		<c:out value="${row.country_name }"/>  ---- Rs.<c:out value="${row.flight_price }"/>/person[return] 
     		---- Rs.<c:out value="${row.star2 }"/>-2 star // Rs.<c:out value="${row.star3 }"/>-3 star 
     		// Rs.<c:out value="${row.star5 }"/>-5 star  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
     		<a href="<%=request.getContextPath() %>/Admin?action=delete_country&id=<c:out value="${row.id }"/>">delete</a> 
     		<a href="<%=request.getContextPath() %>/Admin?action=edit_country&id=<c:out value="${row.id }"/>">edit</a>
     		<hr>
     		</c:forEach>
      </td>
      </tr>
      
      </table>    
          
        </div>
      </div>
    </section>
</body>
</html>







