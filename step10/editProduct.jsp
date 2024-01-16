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
<title>상품 수정</title>
<script>
	function deleteConfirm(id){
		if(confirm("해당 상품을 정말 삭제하시겠습니까?")==true) location.href="./processDeleteProduct.jsp?id="+id;
		else
			event.stopProgation();
			event.preventDefault();
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<%--4.관리자 모드에서 상품수정과 상품삭제를 하기 위해 editProduct.jsp 현재 파일을 만들었고 ?뒤의 edit의 매개변수 값에 따라서 버튼의 종류가 수정 혹은 삭제로 바뀌도록 구현=> updateProduct.jsp생성해서 이동--%>
	<%@ include file="dbconn.jsp"%>
	<%@ include file="/menu.jsp"%>
	
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">상품 수정</h1>
		</div>
	</div>

	<div class="container">
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
				<%
					if(edit.equals("update")){					
				%>
				<a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-warning">수정
					&raquo;</a>
				<%
					}else if(edit.equals("delete")){
				%>
				<a href="#" class="btn btn-danger" onclick="deleteConfirm('<%=rs.getString("p_id")%>')">삭제
					&raquo;</a>
				<%
					}
				%>
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

	<%@ include file="footer.jsp"%>
	
	 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>





