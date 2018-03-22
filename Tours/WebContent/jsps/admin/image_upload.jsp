<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function showImage(pac){
	if(pac == "select"){
		return false;
	}
	xmlhttp = new XMLHttpRequest();
	//var url ="jsps/main/fetch.jsp?dest=" + dest + "&days=" + days;	
	var url ="http://localhost:8080/Tours/Admin?action=show_upload&pac=" + pac;	
	
	xmlhttp.onreadystatechange = stateChange1;
	xmlhttp.open("GET",url,true); //method(GET/POST) , URL(fetch.jsp) , TRUE/FALSE
	 
	xmlhttp.send();
	
	function stateChange1(){
		var responseText = xmlhttp.responseText;
		document.getElementById("show").innerHTML = responseText;
	}
}
</script>
</head>
<body>
<c:import url="../../header.jsp"></c:import>
 <section id ="tour1" class="section-padding">
      <div class="container" id="packages">
        <div class="row">
          <div class="alert alert-success fade in">
                                   <strong>Welcome</strong> Admin
           </div>     
          <h1>
	Add Images to Packages
</h1>
	<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/tour"
     user="root"  password=""/>

<sql:query dataSource="${ds}" var="result" >
select * from package
</sql:query>
<c:out value="${msg }"/>
<BR>
Select Package: 
      <select name="package" class="form-control" onchange='showImage(this.value)'> 
      <option value="select">--select package--</option>
      <c:forEach var="row" items="${result.rows }">
      <option value="${row.id }"/><c:out value="${row.pname }"/></option>
      </c:forEach>
      </select>
      <BR><BR>    
      <div id="show"></div>
     
          
     </div>
   </div>
   
 </section>         

</body>
</html>