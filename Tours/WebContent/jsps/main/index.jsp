<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
<script type="text/javascript">
function destination(location){
	if(location == "select"){
		return false;
	}
	xmlhttp = new XMLHttpRequest();
	//var url ="jsps/main/fetch.jsp?dest=" + dest + "&days=" + days;	
	var url ="http://localhost:8080/Tours/Tour?action=country&location=" + location;	
	
	xmlhttp.onreadystatechange = stateChange1;
	xmlhttp.open("GET",url,true); //method(GET/POST) , URL(fetch.jsp) , TRUE/FALSE
	 
	xmlhttp.send();
	
	function stateChange1(){
		var responseText = xmlhttp.responseText;
		document.getElementById("country").innerHTML = responseText;
	}
}
function estimate(){
	var tour = document.getElementById("tour").value;
	var days = document.getElementById("days").value;
	var person = document.getElementById("person").value;
	
	var fav = [];
	$.each($("input[name='country[]']:checked"), function(){            
	    fav.push($(this).val());
	});
	var str="";
	for(var i=0;i<fav.length;i++){
		str += fav[i] + ",";
	}
	alert(tour +"--" + days + "--" + person + "--" + str);
	
}
function days(days){
	var dest = document.getElementById("destination").value;
	xmlhttp = new XMLHttpRequest();
	//var url ="jsps/main/fetch.jsp?dest=" + dest + "&days=" + days;	
	var url ="http://localhost:8080/Tours/Tour?action=days&dest=" + dest + "&days=" + days;	
	
	xmlhttp.onreadystatechange = stateChange1;
	xmlhttp.open("GET",url,true); //method(GET/POST) , URL(fetch.jsp) , TRUE/FALSE
	 
	xmlhttp.send();
	
	function stateChange1(){
		var responseText = xmlhttp.responseText;
		document.getElementById("days_info").innerHTML = responseText;
	}
}
function email(){
	//var rs="Enter Email: <BR>" +"<input type=\"text\" id=\"email_id\" name=\"email\" class=\"form-control\">" + "<input type="button" onclick="sendemail()">";
	var rsp="Enter Email: <BR> <input type=\"email\" id=\"email_id\" name=\"email\" class=\"form-control\" required><BR><button class=\"btn btn-danger\" onclick=\"sendemail() \">Send Email</button>";
	
	document.getElementById("email_box").innerHTML = rsp;
}
function sendemail(){
	
	var email = document.getElementById("email_id").value;
	var country_list = document.getElementById("country_list").value;
	var days = document.getElementById("days").value;
	var fprice = document.getElementById("fprice").value;
	var person = document.getElementById("person").value;
	var hotel_price = document.getElementById("hotel_price").value;
	var total = document.getElementById("total").value;
	
	//validate email
	if(/[^\s@]+@[^\s@]+\.[^\s@]+/.test(email)){
		xmlhttp = new XMLHttpRequest();
		var url ="mail.jsp?country_list=" + country_list + "&email=" + email + "&days=" + days+ "&person=" + person + "&fprice=" + fprice+ "&total=" + total + "&hotel_price=" + hotel_price; 
		xmlhttp.onreadystatechange = stateChange1;
		xmlhttp.open("GET",url,true); //method(GET/POST) , URL(fetch.jsp) , TRUE/FALSE
		document.getElementById("email_box").innerHTML = '<img src=\'images/mail.gif\'>';
		xmlhttp.send();
		
		function stateChange1(){
			var responseText = xmlhttp.responseText;
			document.getElementById("email_box").innerHTML = responseText;
		}
	}
	else{
		document.getElementById("error_msg").innerHTML = "Invalid email";
		
	}
}
function person(num_person){
	var dest = document.getElementById("destination").value;
	var days = document.getElementById("days").value;
	
	xmlhttp = new XMLHttpRequest();
	//var url ="jsps/main/fetch.jsp?dest=" + dest + "&days=" + days;	
	var url ="http://localhost:8080/Tours/Tour?action=num_person&dest=" + dest + "&days=" + days +
			"&num_person=" + num_person;	
	
	xmlhttp.onreadystatechange = stateChange1;
	xmlhttp.open("GET",url,true); //method(GET/POST) , URL(fetch.jsp) , TRUE/FALSE
	 
	xmlhttp.send();
	
	function stateChange1(){
		var responseText = xmlhttp.responseText;
		document.getElementById("person_info").innerHTML = responseText;
	}
}
</script>
</head>
<body>

<c:import url="../../header.jsp"/>
<br><br>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" user="root" password="" 
url="jdbc:mysql://localhost:3306/tour" />

<sql:query dataSource="${ds}" var="result">
SELECT * from package 
</sql:query>  

<sql:query dataSource="${ds}" var="result1">
SELECT * from continent 
</sql:query>  
<section id ="t1" class="section-padding">

 <div class="section">
	    	<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div>
                                  <div class="modal-dialog1">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              
                                              <p class="modal-title"><font color="grey" size="4">Make Your Own Custom Tour </font></p> 
                                          </div>
                                          <div class="modal-body">
													
													<form method="post" action="<%=request.getContextPath() %>/Quote">
													<input type="hidden" name="action" value="quote_form">
														Select Tour: <select name="tour" id="tour"
														onchange='destination(this.value)' class="form-control" >
														
														<option value="select">--Select Tour--</option>
														<c:forEach var="row1" items="${result1.rows }">
														<option value="<c:out value="${row1.id }"/>"><c:out value="${row1.name }"/> Tour </option>
														</c:forEach>
														
														
														</select>
														<div id="country">
														
														</div>
														<BR>
														<div class="form-group">
														Number of Days: 
														<BR>
														<input type="radio" name="days" value="2" id="days"/> 1-2 Days 
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="days" value="4" id="days"/> 3-4 Days
														<br><br>
														<input type="radio" name="days"  value="6" id="days"/> 5-7 Days 
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														 <input type="radio" name="days" value="8" id="days"/> 8-12 Days 
														</div>
														<BR>
														<div class="form-group">
														Number of Person(s): 
														<BR>
														<input type="radio" name="person" id="person" value="2"/> 2 Persons
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<input type="radio" name="person" id="person" value="4"/> 4 Persons
														<br><br>
														<input type="radio" name="person" id="person" value="6"/> 6 Persons 
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														 <input type="radio" name="person" id="person" value="8"/> 8+ Persons 
														</div>
														<BR>
														<div class="form-group">
														<button type="submit" class="btn btn-danger" >Get Estimate</button>
														</div>
														
														</form>
												
                                          </div>
                                          
                                          <div class="modal-footer">
                                            Alternatively,  You can also send an email at <strong>info@mytour.com</strong>
                                              
                                             
                                          </div>
                                      </div>
                                  </div></div>
					</div>
					<div class="col-sm-6">
						<div id="dest_info" class="dest">
						<h1 align="center">Featured Packages</h1>
						<c:if test='${flag != "100" }'>
						<c:forEach var="p" items="${result.rows }">
						<c:if test='${p.featured == "yes" }'>
						 <div>
            <div class="price-table">
              <!-- Plan  -->
              <div class="pricing-head">
                <h4><c:out value="${p.pname }"/></h4>
                Rs. <span class="amount"><c:out value="${p.price }"/></span> 
              </div>
          
              <!-- Plean Detail -->
              <div class="price-in mart-15">
                <a href="<%=request.getContextPath() %>/Home?action=show_package_details&id=<c:out value="${p.id }"/>" class="btn btn-bg green btn-block">View Details</a> 
              </div>
            </div>
          </div>
          <BR>
						</c:if>
						</c:forEach>
						
          
						
						</c:if>
						
						<c:if test='${flag == "100" }'>
						<h2>Your Tour Estimate:</h2>
						
						<h4>Countries included in the tour </h4>
						<c:forEach var="c" items="${country_list }">
						-><c:out value="${c }"/> <BR>
						</c:forEach>
					
						<h4>Airfare</h4>
						Air Fare (1 person - Two way - Economy): 
						<strong>Rs. <c:out value="${fprice }"></c:out></strong><BR>
						For <c:out value="${person }"/> person(s) , Cost: Rs. <c:out value="${fprice*person }"></c:out>
						
						<h4>Hotel</h4>
						Hotel Rate (1 room[couple] - 1 day - 3Star): 
						<strong>Rs. <c:out value="${hotel_price }"/></strong><BR>
						Tour days: <c:out value="${days }"/><BR>
						For <c:out value="${person }"/> person(s) , <c:out value="${days }"/> days, Cost: Rs. <c:out value="${hotel_price * days }"></c:out>
						<BR>
						Note: <BR>2 Star Hotel Rate: Rs. <c:out value="${hotel_price2 }"/> <BR>
						5 Star Hotel Rate: Rs. <c:out value="${hotel_price5 }"/> 
						<h4>Total Cost</h4>
						
						<font color="blue" size="5">Rs. <c:out value="${total }"></c:out>/-</font>
						<BR>
						<button class="btn btn-primary" 
						onclick="email()">
						Email me this Quote</button>
						<BR>
						<div id="error_msg"></div>
						<div id="email_box">
						</div>
						</c:if>
						</div>
<div> <input type="hidden" id="country_list" value="<c:out value="${country_list }"/>">
<input type="hidden" id="days" value="<c:out value="${days }"/>">
<input type="hidden" id="person" value="<c:out value="${person }"/>">
<input type="hidden" id="fprice" value="<c:out value="${fprice }"/>">
<input type="hidden" id="hotel_price" value="<c:out value="${hotel_price }"/>">
<input type="hidden" id="total" value="<c:out value="${total }"/>">
</div>
<div id="person_info"></div>
					</div>
					</div>
					</div>
</div>
		</section>			
<section id="work-shop" class="section-padding">
      <div class="container">
        <div class="row">
          <div class="header-section text-center">
            <h2>International Tour Packages</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.</p>
            <hr class="bottom-line">
          </div>
           <c:forEach var="row" items="${result.rows}">
          <div class="col-md-4 col-sm-6">
            <div class="service-box text-center">
              <div class="icon-box">
                <i class="fa fa-html5 color-green"></i>
              </div>
              <div class="icon-text">
                <h4 class="ser-text"><a href="<%=request.getContextPath() %>/Home?action=show_package_details&id=<c:out value="${row.id }"/>"> 
               <c:out value="${row.pname }"/> </a></h4>
              </div>
            </div>
          </div>
          </c:forEach>
</div>
</div>
</section>

 <!--Package Listing-->
    <section id="faculity-member" class="section-padding">
      <div class="container" id="packages">
        <div class="row">
        <div class="header-section text-center">
            <h2>India Tour Packages</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem nesciunt vitae,<br> maiores, magni dolorum aliquam.</p>
            <hr class="bottom-line">
          </div>
          <c:forEach var="row" items="${result.rows}">
          
          
          <div class="col-lg-4 col-md-4 col-sm-4">
            <div class="pm-staff-profile-container" >
              <div class="pm-staff-profile-image-wrapper text-center">
                <div class="pm-staff-profile-image">
                  <img src="img/mentor.jpg" alt="" class="img-thumbnail img-circle" />
                </div>   
              </div>                                
              <div class="pm-staff-profile-details text-center">  
               <p class="pm-staff-profile-name"> <a href="<%=request.getContextPath() %>/Home?action=show_package_details&id=<c:out value="${row.id }"/>"> 
               <c:out value="${row.pname }"/> </a></p>
                <!--  <p class="pm-staff-profile-title">Lead Software Engineer</p> -->
               </div>     
            </div>
          </div>
          </c:forEach>
          
        </div>
      </div>
    </section>
    <!--/ package listing-->


</body>
</html>