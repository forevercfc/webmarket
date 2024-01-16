<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>주문취소</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>

	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">주문 취소</h1>
		</div>
	</div>
	<div class="container col-md-8">
		<div class="row">
			<div class="col-12">
				<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>				
	</div>
	<!-- container-fluid -->
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-info">상품목록 바로가기</a></p>
	</div>
	
	

	<%@ include file="footer.jsp"%>
</body>
</html>