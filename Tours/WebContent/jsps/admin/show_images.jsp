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
<BR>
<!-- Display of tour forms starts here -->
 <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/tour"
     user="root"  password=""/>

<sql:query dataSource="${ds}" var="result" >
select * from package,images where package.id = images.package_id
</sql:query>
    <section id ="tour1" class="section-padding">
      <div class="container" id="packages">
        <div class="row">
          <div class="alert alert-success fade in">
                                   <strong>Welcome</strong> Admin
           </div>     
      <table >
      <tr>
      <td width="30%" valign="top"> 
      <a href="<%=request.getContextPath() %>/Admin"> Dashboard</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=add_tour"> Add Tour Package</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=featured_package"> Featured Packages</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=edit_tour"> Edit/ Change Tour Packages</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=add_image"> Add image to Packages</a>
      <hr>
      <a href="<%=request.getContextPath() %>/Admin?action=add_country"> Add Country</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=manage_country"> Manage Country Listings</a>
      </td>
      <td>
      <c:forEach items="${result.rows }" var="row">
      <img src="<c:out value="${row.name }"/>" width="300" height="250">
      <br>
      <c:out value="${row.pname }"></c:out>  
      <HR>
     
      </c:forEach>
      </td>
      </tr>
      </table>    
      </div>
      </div>
    </section>
</body>
</html>







