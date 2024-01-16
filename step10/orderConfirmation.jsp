<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@page import="java.net.URLDecoder" %>

<%
	request.setCharacterEncoding("utf-8");
	String cartId = session.getId();
	
	//주문정보를 저장할 변수 선언과 초기화
	String Shipping_cartId="";
	String Shipping_name="";
	String Shipping_shippingDate="";
	String Shipping_country="";
	String Shipping_zipCode="";
	String Shipping_addressName="";
	
	Cookie[] cookies= request.getCookies();
	
	if(cookies !=null){
		for(int i=0; i<cookies.length; i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			
			String decode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			
			if(n.equals("Shipping_cartId")) Shipping_cartId =decode;
			if(n.equals("Shipping_name")) Shipping_name = decode;
			if(n.equals("Shipping_shippingDate")) Shipping_shippingDate = decode;
			if(n.equals("Shipping_country")) Shipping_country = decode;
			if(n.equals("Shipping_zipCode")) Shipping_zipCode = decode;
			if(n.equals("Shipping_addressName")) Shipping_addressName = decode;
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
<title>주문정보</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>

	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">주문정보</h1>
		</div>
	</div>
	<div class="container col-md-8 bg-info">
		<div class="row">
			<div class="col text-center">
				<h1>영수증</h1>
			</div>


		</div>

		<div class="row">
			<div class="col-4" text-left>
				<strong>배송주소</strong> <br /> 
				성명 : <%out.print(Shipping_name); %><br />
				 우편번호 :  <%out.print(Shipping_zipCode); %><br /> 
				 주소 :  <%out.print(Shipping_addressName); %><br />
			</div>

			<div class="col-4" text-right>
				<strong>배송일자  : <%out.print(Shipping_shippingDate); %> </strong> <br />
			</div>
		</div>
		<!-- 주문한 데이터를 테이블로 가져오기 -->
		<table class="table table-hover">
			<tr>
				<th class="text-center">제품</th>
				<th class="text-center">수량</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
				if(cartList ==null) cartList = new ArrayList<Product>();
				
				for(int i=0; i<cartList.size();i++){
					Product product = cartList.get(i);
					int total = product.getUnitPrice()*product.getQuantity();
					sum = sum+total;
				
			%>
			<tr>
				<td class="text-center"><%=product.getPname() %></td>
				<td class="text-center"><%=product.getQuantity() %></td>
				<td class="text-center"><%=product.getUnitPrice() %></td>
				<td class="text-center"><%=total %></td>
			</tr>
			<%
				}
				
			%>
			<tr>
				<td class="text-right"></td>
				<td class="text_right"></td>

			</tr>
		</table>

		<div class="form-group row">
			<div class="col">
				<a href="./shippingInfo.jsp" class="btn btn-warning">이전</a> 
				<a href="./thanksCustomer.jsp" class="btn btn-info">주문완료</a>
				<a href="./checkOutCancelled.jsp" class="btn btn-danger">취소</a>
			</div>
		</div>
	</div>
	<!-- container-fluid -->

	<%@ include file="footer.jsp"%>

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





