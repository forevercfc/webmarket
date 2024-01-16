<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@page import="java.net.URLDecoder" %>
<%@page import="java.util.Enumeration" %>
<%
	request.setCharacterEncoding("utf-8");
	String cartId = session.getId();
	
	//주문정보를 저장할 변수 선언과 초기화
	String Shipping_cartId="";	
	String Shipping_shippingDate="";
	
	
	Cookie[] cookies= request.getCookies();
	
	if(cookies !=null){
		for(int i=0; i<cookies.length; i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			String decode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			
			if(n.equals("Shipping_cartId")) Shipping_cartId = decode;			
			if(n.equals("Shipping_shippingDate")) Shipping_shippingDate = decode;

		}
	}
%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<title>주문 완료</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>

	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">주문 완료</h1>
		</div>
	</div>
	<div class="container col-md-8">
		<div class="row">
			<div class="col-12">
				<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
				<p>주문은 <%out.println(Shipping_shippingDate); %>에 배송될 예정입니다.</p>
				<p>주문번호는 <%out.println(Shipping_cartId); %>입니다.</p>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12">
				<p><a href="./products.jsp">상품목록 바로가기</a></p>
			</div>
		</div>
	</div>
	<!-- container-fluid -->
	
	

	<%@ include file="footer.jsp"%>
	
	<%
		session.removeAttribute("cartlist");
	//쿠키 삭제-
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("Shipping_cartId")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_name")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_country")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_zipCode")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName")) thisCookie.setMaxAge(0);
	}
	%>

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>


</body>
</html>





