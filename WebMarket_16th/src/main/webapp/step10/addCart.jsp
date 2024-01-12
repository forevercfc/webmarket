<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCart.jsp</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}

	if (id == null) {
		response.sendRedirect("exceptionNoProduct.jsp");
	}

	String sql = "select * from product where p_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "update product set p_quantity = p_quantity + 1 where p_id=?";
		pstmt= conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();

	}

	response.sendRedirect("product.jsp?id="+ id);
	%>
</body>
</html>