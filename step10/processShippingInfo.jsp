<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processShippingInfo.jsp</title>
</head>
<body>
	<%
	/* 폼에서 전송된 정보들을 던달받아서 이를 쿠키로 생성하도록 쿠키클래스 이용 */
	request.setCharacterEncoding("utf-8");

	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"),"utf-8"));
	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate", URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
	Cookie country = new Cookie("Shipping_country",URLEncoder.encode(request.getParameter("country"),"utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName",URLEncoder.encode(request.getParameter("addressName"),"utf-8"));

	/* 생성한 쿠키의 유효시간을 24시간으로 설정 */
	name.setMaxAge(60 * 60 * 24);
	cartId.setMaxAge(60 * 60 * 24);
	shippingDate.setMaxAge(60 * 60 * 24);
	country.setMaxAge(60 * 60 * 24);
	zipCode.setMaxAge(60 * 60 * 24);
	addressName.setMaxAge(60 * 60 * 24);

	/* 	쿠키를 등록  */
	response.addCookie(name);
	response.addCookie(cartId);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	/* 주문정보페이지로 이동 */
	response.sendRedirect("orderConfirmation.jsp");
	
	
	
	
	%>
	
	
</body>
</html>