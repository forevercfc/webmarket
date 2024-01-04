<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String sessionId = (String) session.getAttribute("sessionId");
%>


<nav class="navbar navbar-expand-lg navbar-light bg-info">
	<ul class="navbar-nav mr-auto">
		<li class="nav-item"><a class="nav-link" href="./addProduct.jsp">상품
				등록</a></li>
		<li class="nav-item"><a class="nav-link"
			href="./editProduct.jsp?edit=update">상품 수정</a></li>
		<li class="nav-item"><a class="nav-link"
			href="./editProduct.jsp?edit=delete">상품 삭제</a></li>
	</ul>
</nav>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="./welcome.jsp">home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="./products.jsp">상품 목록<span class="sr-only">(current)</span></a>
			</li>
		</ul>

		<!--  회원 로그인 관련 -->

		<ul class="navbar-nav ml-auto">
			<c:choose>
				<c:when test="${empty sessionId}">
					<li class="nav-item active"><a class="nav-link"
						href="<c:url value="/member/loginMember.jsp"></c:url>">로그인</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/member/addMember.jsp"></c:url>">회원가입</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item text-white">
					[<%=sessionId%>]님 로그인 중
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/member/logoutMember.jsp"></c:url>">로그아웃</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="<c:url value="/member/updateMember.jsp"></c:url>">회원수정</a>
					</li>
				</c:otherwise>
			</c:choose>
		</ul>

	</div>
</nav>



<div class="dropdown-menu">
	<a class="dropdown-item" href="#">회원 로그인</a> <a class="dropdown-item"
		href="#">주문 정보</a> <a class="dropdown-item" href="#">배송 정보</a>
	<div class="dropdown-divider"></div>
	<a class="dropdown-item" href="adminMember.jsp">회원 가입</a> <a
		class="dropdown-item" href="#">회원 수정</a>
</div>





