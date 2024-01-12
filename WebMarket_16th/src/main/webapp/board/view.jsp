<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="mvc.model.BoardDTO" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember</title>
</head>
<body>
	<!-- request객체에서 원하는 속성값 가져와서 형변환후 변수에 저장 -->
	<%
		BoardDTO notice = (BoardDTO)request.getAttribute("board");
		int num = (Integer)request.getAttribute("num");
		int nowpage = (Integer)request.getAttribute("page");
	
	%>
	
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4"> 게시판 </h1>
		</div>
	</div>
	
	<div class="container mb-5">
		<div class="row">
			<div class="offset-2 col-md-8 px-0">
				<!-- form -->
				<form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum() %>&pageNum=<%=nowpage %>" method="post">
				  <div class="form-group">
				    <label for="id">성명</label>
				    <input type="text" class="form-control" name="name" value="<%=notice.getName()%>">
				  </div>
				  <div class="form-group">
				    <label for="id">제목</label>
				    <input type="text" class="form-control" name="subject" value="<%=notice.getSubject()%>">
				  </div>
				   <div class="form-group">
				    <label for="id">내용</label>
				   	<textarea name="content" id="" class="form-control" cols="30" rows="10"><%=notice.getContent()%>
				   	</textarea>
				  </div>
				  <div class="row">
				  	<div class="col-8">
				  		<c:set var="userId" value="<%=notice.getId() %>"/>
				  		<!-- 본인이 쓴 글에만 수정, 삭제버튼 보이도록 설정 -->
				  		<c:if test="${sessionId==userId}">
				  			<a href="./BoardDeleteAction.do?num=<%=notice.getNum() %>&pageNum=<%=nowpage %>" class="btn btn-danger">삭제</a>
				  			<input class="btn btn-warning" type="submit" value="수정"/>
				  		</c:if>
				  	</div>
				  	<div class="col-4">
				  		<a href="./BoardListAction.do?pageNum=<%=nowpage %>" class="float-right btn btn-info">목록</a>
				  	</div>
				  </div>
				  
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>