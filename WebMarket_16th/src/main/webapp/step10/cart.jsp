<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProduct.jsp"%>

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
<title>장바구니</title>
</head>
<body>

	<%@ include file="dbconn.jsp"%>
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4">장바구니</h1>
		</div>
	</div>

	<%
	String sql = "select * from product where p_quantity > 0";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	%>



	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td><a href="" class="btn btn-danger">장바구니 리스트 모두 삭제하기</a></td>
					<td><a href="" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>

		<div class="row">
			<table width="100%">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
				int sum = 0; //결제 총액

				while (rs.next()) {
					int count = 0;
					int total = rs.getInt("p_unitPrice") * rs.getInt("p_quantity");
					sum = sum + total; //결제 총액에 구매금액을 더한것.=> 결제 총액
				%>
				<tr>
					<td><%=rs.getString("p_id")%> - <%=rs.getString("")%></td>
					<td><%=rs.getString("p_unitPrice")%></td>
					<td><%=rs.getString("p_quantity")%></td>
					<td><%=total%></td>
					<td class="btn"><a href="">삭제</a></td>
				</tr>
				<%
				}
				%>
				<tr>
					<td></td>
					<td></td>
					<td>총액</td>
					<td><%=sum%></td>
					<td></td>
				</tr>

			</table>
		</div>
	</div>

	<%@ include file="/footer.jsp"%>

	<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>
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






