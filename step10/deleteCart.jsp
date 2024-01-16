<%@page import="org.apache.taglibs.standard.lang.jstl.EnumeratedMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.ProductRepository" %>
<%@page import="dto.Product" %>
<%@page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteCart.jsp</title>
</head>
<body>
	<%
	String id = request.getParameter("cartId");
	if(id==null){
		response.sendRedirect("cart.jsp");
		return;
	}
	//값이 있으면 세션을 모두 무효화하여 장바구니에 등록된 모든 상품을 삭제(해당 아이디값까지 삭제)
/* 	session.invalidate();
	response.sendRedirect("cart.jsp"); */
	
/* 	Enumeration en = session.getAttributeNames();	
	String name = en.nextElement().toString();
	String value = session.getAttribute(name).toString(); */

	
	session.removeAttribute("cartlist");
	
	response.sendRedirect("cart.jsp");
	//
	%>
</body>
</html>