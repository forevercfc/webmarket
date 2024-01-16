<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <title>Welcome</title>
</head>
<body>
	<%@ include file="/menu.jsp" %>
	<%!
		String greeting = "쇼핑몰에 오신것을 환영합니다.";
		String tagline = "Welcome to Web Market!";
	%>
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4"><%=greeting %></h1>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col text-center">
				<p class="lead"><%=tagline %></p>
				<%
					response.setIntHeader("Refresh",10);
					Date day = new java.util.Date();
					String am_pm;
					int hour = day.getHours();
					int minute = day.getMinutes();
					int second = day.getSeconds();
					if(hour/12==0){
						am_pm = "AM";
					}else{
						am_pm = "PM";
						hour = hour - 12;
					}
					String CT = hour+":"+minute+":"+second+" "+am_pm;
					out.println("현재 접속 시각 : "+CT+"\n");
				%>
			</div>
		</div>
	</div><!-- container-fluid -->
	
	<%@ include file="footer.jsp" %>
	
	 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    

</body>
</html>





