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
  
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/tour"
     user="root"  password=""/>

<sql:query dataSource="${ds}" var="result" >
select * from country where id='<c:out value="${id }"/>'
</sql:query>
    
<BR>
    <section id ="tour1" class="section-padding">
      <div class="container" id="packages">
        <div class="row">
          <div class="alert alert-success fade in">
                                   <strong>Welcome</strong> Admin
           </div>     
          
      <table>
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
      
      
      </td>
      <td>
      <!-- Display of tour forms starts here -->
      
      
    
     
	<font color="red"><c:out value="${msg }"/></font>
	<BR>
	<c:forEach var="row" items="#{result.rows }">
	
	 <form action="<%=request.getContextPath() %>/Admin" method="post">
      <input type="hidden" name="action" value="edit_country_form">
      <input type="hidden" name="id" value='<c:out value="${id }"/>'>
      
      Country Name: <input type="text" class="form-control" name="cname" value=<c:out value="${row.country_name }"/>>
     <BR><BR>
    Flight Price: <input type="text" class="form-control" name="fprice" value="<c:out value="${row.flight_price }"/>">
     <BR><BR>
     Hotel Rates:
     <BR>2 Star: <input type="text" class="form-control" name="2star" value="<c:out value="${row.star2 }"/>">
     <BR>3 Star: <input type="text" class="form-control" name="3star" value="<c:out value="${row.star3 }"/>">
     <BR>5 Star: <input type="text" class="form-control" name="5star" value="<c:out value="${row.star5 }"/>">
     <br><br>
                         
                                          
      <input type="submit" value="Edit Country" class="btn btn"/>
      </form>
     
	</c:forEach>
     
      </td>
      </tr>
      
      </table>    
          
        </div>
      </div>
    </section>
</body>
</html>







