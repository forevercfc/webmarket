<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProduct.jsp" %>
<%@page import="dao.ProductRepository" %>
<%@page import="dto.Product" %>
<!DOCTYPE html>
<html>
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
<title>Welcome</title>
</head>
<body>
	 
	<%@ include file="dbconn.jsp"%>
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">상품 정보</h1>
		</div>
	</div>
	<!-- 장바구니에 추가버튼 클릭시 로그인하세요 추가하기위해 sessionId얻어옴 -->
	<%	
		sessionId = (String)session.getAttribute("sessionId");
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id); 
	
		String sql = "select * from product where p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="../resources/images/<%=rs.getString("p_filename") %>" alt="" class="img-fluid"/>
			</div>
			<div class="col-md-6">
				<!-- 데이터 가져오기 -->
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription() %></p>
				<p>
					<b>상품코드 : </b><span><%=product.getProductId()%></span>
				</p>
				<p>
					<b>제조사 : </b><%=product.getManufacturer()%></p>
				<p>
					<b>분류 : </b><%=product.getCategory()%></p>
				<p>
					<b>재고 수: </b><%=product.getUnitsInStock()%></p>
				<p>
					<%=product.getUnitPrice()%>원
				</p>
				<div>
                <form action="./addCart.jsp?id=<%=product.getProductId()%>" name="addForm" method="post">
                  <input class="btn btn-warning" onclick="addToCart()" value="상품을 장바구니에 추가 &raquo;"></input>
                  <a class="btn btn-dark" href="./cart.jsp">장바구니 &raquo;</a>
                  <a class="btn btn-primary" href="./products.jsp">상품 목록 &raquo;</a>
               </form>
            </div>
			</div>
		</div>
	</div>
	<%
		}
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		if(rs != null) rs.close();
	%>

	<%@ include file="/footer.jsp"%>
	
	 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
     <script>
   		function addToCart() {
   			if(${sessionId==null}){
   				alert("로그인해주세요.");
   				location.href='<c:url value="/member/loginMember.jsp"/>';
   				return false;
   			}
   			
			if(confirm("상품을 장바구니에 추가 하시겠습니까?")){
				document.addForm.submit();
			}else{
				document.addForm.reset();
			}
		}
   </script>
</body>
</html>






