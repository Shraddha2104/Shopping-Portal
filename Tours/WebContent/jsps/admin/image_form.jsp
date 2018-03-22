<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 Upload Image:
 <form method="post" action="<%=request.getContextPath() %>/Admin?action=image_upload&pac=<%=request.getAttribute("pac") %>" enctype="multipart/form-data">
 
<input type="file" name="file" >
<input type="submit" name="submit" value="Upload" class="btn btn-primary">
</form>

     
</body>
</html>