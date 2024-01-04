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
	<%--  1.db접속 연결하고 database의 select결과로 얻어온 rs객체에서 각 컬럼명에 해당하는 데이터를 설정함=>product로 이동 --%>
	<%@ include file="dbconn.jsp"%>
	<%@ include file="/menu.jsp"%>
	
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">상품 목록</h1>
		</div>
	</div>

	<div class="container">
	<%-- <%String realFolder = application.getRealPath("/resources/images/"); %> --%>
		<div class="row">
		<%
			String sql = "select * from product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
		%>
		<div class="col-md-4">
			<img src='../resources/images/<%=rs.getString("p_filename") %>' alt="" class="img-fluid"/>
			<h3><%=rs.getString("p_name") %></h3>
			<p><%=rs.getString("p_description") %></p>
			<p><%=rs.getString("p_unitPrice") %>원
			</p>
			<p>
				<a href="./product.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary">상세 정보
					&raquo;</a>
			</p>
		</div>
		<%
			}
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			if(rs != null) rs.close();
		%>
		</div><!-- row -->
	</div><!-- container -->

	<%@ include file="/footer.jsp"%>
	
	 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>





