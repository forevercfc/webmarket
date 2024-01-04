<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	<%-- 2.db에서 select로 얻어온 해당 제품 아이디에 대한 데이터들을 rs.getString("컬럼명")을 이용하여 가져와서 적합한 위치에 뿌려줌 =>processAddProduct.jsp--%> 
	<%@ include file="dbconn.jsp"%>
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">상품 정보</h1>
		</div>
	</div>
	<%		
		String id = request.getParameter("id");
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
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %></p>
				<p>
					<b>상품코드 : </b><span><%=rs.getString("p_id")%></span>
				</p>
				<p>
					<b>제조사 : </b><%=rs.getString("p_manufacturer") %></p>
				<p>
					<b>분류 : </b><%=rs.getString("p_category") %></p>
				<p>
					<b>재고 수: </b><%=rs.getString("p_unitsInStock") %></p>
				<p>
					<%=rs.getString("p_unitPrice") %>원
				</p>
				<p>
					<a class="btn btn-info" href="">상품 주문 &raquo;</a> 
					<a class="btn btn-secondary" href="./products.jsp">상품 목록&raquo;</a>
				</p>
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
</body>
</html>






