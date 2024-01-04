<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원</title>
</head>
<body>
	
	<%@ include file="/menu.jsp" %>

	
	<div class="jumbotron jumbotron-flui d">
		<div class="container text-center">
		
			<h1 class="display-4">회원정보</h1>
			
		</div>
		
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col">
				
				<%
					String msg = request.getParameter("msg");
					
					if(msg != null) {
						if(msg.equals("0")) out.println("<h3 class='alert alert-warning py-5'>회원 정보가 수정되었습니다.</h2>");
						else if(msg.equals("1")) out.println("<h3 class='alert alert-primary py-5'>회원 가입을 축하합니다.다시 로그인 해주세요.</h2>");
						else if(msg.equals("2")){
							String loginId = (String)session.getAttribute("sessionId");
							out.println("<h3 class='alert alert-info py-5'>"+ loginId +"님 환영합니다.</h2>");
						}

					} else {
						out.println("<h3 class='alert alert-danger py-5'>회원 정보가 삭제되었습니다.</h2>");

					}
				%>
				
			</div>
		</div>
	</div>
	
	
</body>
</html>