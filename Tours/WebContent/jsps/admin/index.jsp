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
  <section id ="tour1" class="section-padding">
      <div class="container" id="packages">
        <div class="row">
          <div class="alert alert-success fade in">
                <strong>Welcome</strong> Admin
           </div>     
      <table>
      <tr>
      <td width="30%" valign="top"> 
      <a href="<%=request.getContextPath() %>/Admin"> Dashboard</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=add_tour"> Add Tour Package</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=all_package"> All Packages</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=edit_tour"> Edit/ Change Tour Packages</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=add_image"> Add image to Packages</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=show_images"> Manage Images</a>
      <hr>
      <a href="<%=request.getContextPath() %>/Admin?action=add_country"> Add Country</a>
      <BR>
      <a href="<%=request.getContextPath() %>/Admin?action=manage_country"> Manage Country Listings</a>
      </td>
      <td>
      <!-- Display of tour forms starts here -->
      
      
      <c:if test='${flag == "100" }'>
      
      <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/tour"
     user="root"  password=""/>

<sql:query dataSource="${ds}" var="result" >
select * from continent
</sql:query>
      <form action="<%=request.getContextPath() %>/Admin" method="post">
      <input type="hidden" name="action" value="add_package_form">
      Select Continent: 
      <select name="continent_id" class="form-control"> 
      <option>--select continent--</option>
      <c:forEach var="row" items="${result.rows }">
      <option value="${row.id }"/><c:out value="${row.name }"/></option>
      </c:forEach>
      </select>
      <BR><BR>
      Package Name: <input type="text" class="form-control" name="pname">
     <BR><BR>
     Package Price: <input type="text" class="form-control" name="price">
     <BR><BR>
     Package Description:
     <!-- CKEditor -->
                          <div class="col-lg-12">
                              <section class="panel">
                                  
                                  <div class="panel-body">
                                      <div class="form">
                                          
                                              <div class="form-group">
                                                 
                                                  <div class="col-sm-10">
                                                      <textarea class="form-control ckeditor" name="details" rows="6"></textarea>
                                                  </div>
                                              </div>
                                         
                                      </div> 
                                  </div>
                              </section>
                          </div>
                                        <BR>  
      <input type="submit" value="Add Package" class="btn btn"/>
      </form>
      </c:if>
      </td>
      </tr>
      
      </table>    
          
        </div>
      </div>
    </section>
</body>
</html>







