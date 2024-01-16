<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
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
<title>배송정보</title>
</head>
<body>
	<%@ include file="/menu.jsp"%>

	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">배송정보</h1>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<form action="./processShippingInfo.jsp" method="post">
					<!-- cartId를 숨겨서 가져감 -->
					<input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>" />
					
					<div class="form-group row">
						<label class="col-sm-2 offset-sm-2 col-form-label">보내는이</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="name" placeholder="성명">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 offset-sm-2 col-form-label">배송일</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="shippingDate" placeholder="(yyyy/mm/dd)">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 offset-sm-2 col-form-label">국가명</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="country" placeholder="">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 offset-sm-2 col-form-label">우편번호</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="zipCode" placeholder="">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2 offset-sm-2 col-form-label">주소</label>
						<div class="col-sm-7">
							<input type="text" class="form-control" name="addressName">
						</div>
					</div>
					
					<div class="form-group row">			
						<div class="col">
							<a href="./cart.jsp" class="btn btn-warning">이전</a>
							<input type="submit" class="btn btn-info" value="전송"  />
							<a href="./checkOutCancelled.jsp" class="btn btn-danger">취소</a>
						</div>
					</div>
					
					
				</form>
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





