<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!---------------------------------------------->

<%
   String sessionId=(String)session.getAttribute("sessionId");
%>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
   integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
   crossorigin="anonymous">
<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
        crossorigin="anonymous"></script>
<!----------------------관리자 모드로 로그인시에만 보이도록 설정------------------------>   
<c:choose>
   <c:when test="${sessionId eq 'admin'}">
      <nav class="navbar navbar-expand-sm navbar-light bg-warning">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item">
            <a class="nav-link" href='<c:url value="/step10/addProduct.jsp"/>'>상품등록</a>
            </li>
            <li class="nav-item">
            <a class="nav-link" href='<c:url value="/step10/editProduct.jsp?edit=update"/>'>상품수정</a>
            </li>
            <li class="nav-item">
            <a class="nav-link"href='<c:url value="/step10/editProduct.jsp?edit=delete"/>'>상품삭제</a>
            </li>
            <li class="nav-item">
            <a class="nav-link"href='<c:url value="/member/memberList.jsp"/>'>회원목록</a>
            </li>
         </ul>
      </nav>
   </c:when>
   <c:otherwise>
   </c:otherwise>
</c:choose>
<!---------------------------------------------->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href='<c:url value="/step10/welcome.jsp"/>'>home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
         <li class="nav-item active">
         <a class="nav-link"
            href='<c:url value="/step10/products.jsp"/>'>상품 목록 <span class="sr-only">(current)</span></a>
         </li>
         <li class="nav-item active">
         <a class="nav-link"
            href='<c:url value="/BoardListAction.do?pageNum=1"/>'>게시판</a>
         </li>
      </ul>
      <!--회원 로그인 관련-->
      <ul class="navbar-nav ml-auto">
         <c:choose>
            <c:when test="${empty sessionId}">
               <li class="nav-item active">
                  <a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인
                  </a>
               </li>
               <li class="nav-item">
                  <a class="nav-link" href="<c:url value="/member/addMember.jsp"/>">회원가입
                  </a>
               </li>
            </c:when>
            <c:otherwise>
               <li class="nav-item pt-2">
                  [<%=sessionId%>]님 로그인
               </li>
               <li class="nav-item"><a class="nav-link"
                  href="<c:url value="/member/logoutMember.jsp"/>">로그아웃</a></li>
               <li class="nav-item"><a class="nav-link"
                  href="<c:url value="/member/updateMember.jsp"/>">회원수정</a></li>
            </c:otherwise>
         </c:choose>
      </ul>
   </div>
</nav>