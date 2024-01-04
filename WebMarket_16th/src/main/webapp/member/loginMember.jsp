<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
		
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login_member</title>
</head>
<body>
	
	<%-- addproduct 에서 가지고옴 --%>
	<%@ include file="/menu.jsp" %>
	
	<%
		String error = request.getParameter("error");
	
		if(error != null) {
			out.println("<div class='alert alert-danger'>");
			out.println("아이디와 비밀번호를 확인해주세요");
			out.println("</div>");
		}
	%>
	
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
	
			<h1 class="display-4"><fmt:message key="title"/>로그인</h1>
	
		</div>
	</div>
	 
	 
	<div class="container mb-5" align="center">
		<div class="row">
			<div class="col-md-8 offset-md-2 px-0">
			
							
				<form name="newMember" action="<c:url value="/member/processLoginMember.jsp"/>">
				
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" placeholder="id" autofocus required>
					</div>
					
					
					
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="text" class="form-control" id="pw" name="pw" placeholder="pw" required>
					</div>
					
					

					<input type="submit" class="btn btn-primary" value="로그인"></input>





				</form>
			
			</div>
		</div>
	</div>
	
	
	<%@ include file="/footer.jsp" %>
	
</body>
</html>