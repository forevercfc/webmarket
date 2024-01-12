<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String name = (String)request.getAttribute("name");
%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteForm.jsp</title>
<script>
	function checkForm(){
		if(!document.newWrite.name.value){
			alert("성명을 입력하세요");
			return false;
		}
		if(!document.newWrite.subject.value){
			alert("제목을 입력하세요");
			return false;
		}
		if(!document.newWrite.content.value){
			alert("내용을 입력하세요");
			return false;
		}
		/* document.newWrite.submit();	 */	
	}
</script>
</head>
<body>
	<!-- 게시판 글쓰는 페이지 구조 생성 -->
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<h1 class="display-4"> 게시판 </h1>
		</div>
	</div>
	
	<div class="container mb-5">
		<div class="row">
			<div class="col-md-8 px-0">
				<!-- form -->
				<form name="newWrite" action="./BoardWriteAction.do" method="post" onsubmit="return checkForm()">	
				  <input type="hidden" name="id" value="${sessionId}"/>
				  <div class="form-group">
				    <label for="id">성명</label>
				    <input type="text" class="form-control" name="name" placeholder="이름">
				  </div>
				  <div class="form-group">
				    <label for="pw">제목</label>
				    <input type="text" class="form-control" name="subject" placeholder="제목">
				  </div>
				  <div class="form-group">
				    <label for="name">내용</label>
				    <input type="text" class="form-control" name="content" placeholder="게시글내용">
				  </div>	  
				
				  <input type="submit" class="btn btn-info" value="등록" >
				  <input type="reset" class="btn btn-danger" value="취소" onclick="reset()">
				  <input type="button" class="btn btn-success" value="이전" onclick="history.back();">
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>