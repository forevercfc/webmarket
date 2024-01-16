<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.ProductRepository" %>
<%@page import="dto.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeCart.jsp</title>
</head>
<body>
	<%
		String id = request.getParameter("pId");
	if(id==null){
		response.sendRedirect("products.jsp");
		return;
	}
		ProductRepository dao = ProductRepository.getInstance();
		Product product= dao.getProductById(id);
		
		if(product == null){
			response.sendRedirect("exceptionNoProductId.jsp");
		}
		
		ArrayList<Product> cartList = 
	(ArrayList<Product>)session.getAttribute("cartlist");
		
		Product goodsQnt = new Product(); //제품객체 생성
		//카트리스트에 등록된 상품을 하나씩 가져와서 루프를 돌려서
		for(int i = 0; i<cartList.size(); i++){
			goodsQnt = cartList.get(i);
			if(goodsQnt.getProductId().equals(id)){
				//요청한 파라미터 아이디와 같으면
				cartList.remove(goodsQnt);
				//해당 객체 데이터 하나만 cartList에서 삭제
			}
		}
		response.sendRedirect("./cart.jsp");
		
		
	
	%>
</body>
</html>