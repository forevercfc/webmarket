<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/menu.jsp"%>
<%
/* String sessionId = (String)session.getAttribute("sessionId"); */
/* response.setContentType("text/html; charset=utf-8");
request.setCharacterEncoding("utf-8"); */
int pageNum = (Integer) request.getAttribute("pageNum");
List boardList = (List) request.getAttribute("boardlist");
int total_record = (Integer) request.getAttribute("total_record");
int total_page = (Integer) request.getAttribute("total_page");
String items = (String) request.getAttribute("items");
String text = (String) request.getAttribute("text");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script>
   function checkForm(){
      if(${sessionId==null}){
         alert("로그인 해주세요");
         location.href="./member/loginMember.jsp";
         return false
      }
      location.href = "./BoardWriteForm.do?id=<%=sessionId%>";
   }
</script>
</head>
<body>

	<div class="container-fluid text-center">
		<div class="row">
			<div class="col px-0">
				<div class="jumbotron jumbotron-fluid">
					<div class="container text-center">
						<h1 class="display-4">게시판</h1>
					</div>
				</div>
				<form action="<c:url value="./BoardListAction.do?"/>" method="post">
					<div class="container table-responsive">

						<div class="text-right">
							<span>전체 <%=total_record%>건
							</span>
						</div>
						<table class="table">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성일</th>
								<th>수정일</th>
								<th>조회</th>
								<th>글쓴이</th>
							</tr>
							<%
							for (int i = 0; i < boardList.size(); i++) {
								BoardDTO boardDTO = (BoardDTO) boardList.get(i);
							%>
							<tr>
								<td><%=boardDTO.getNum()%></td>
								<td><a
									href="./BoardViewAction.do?num=<%=boardDTO.getNum()%>&pageNum=<%=pageNum%>"><%=boardDTO.getSubject()%></a>
								</td>
								<td><%=boardDTO.getRegist_day()%></td>
								<td><%=boardDTO.getUpdate_day()%></td>
								<td><%=boardDTO.getHit()%></td>
								<td><%=boardDTO.getName()%></td>
							</tr>
							<%
							}
							%>
						</table>
					</div>
					<!-- container -->
					<!-- 페이징 구조 추가 -->
					<div class="text-center">
						<c:set var="pageNum" value="<%=pageNum%>" />
						<c:set var="items" value="<%=items%>" />
						<c:set var="text" value="<%=text%>" />
						<c:forEach var="i" begin="1" end="<%=total_page%>">
							<%-- <a href="<c:url value="./BoardListAction.do?pageNum=${i}&items='+${items}+'&text='+${text}+'"/>"> --%>
							<a href="<c:url value='./BoardListAction.do?pageNum=${i}' />">
								<c:choose>
									<c:when test="${pageNum==i}">
										<b>[${i}]</b>
									</c:when>
									<c:otherwise>
                           [${i}]
                        </c:otherwise>
								</c:choose>
							</a>
						</c:forEach>
					</div>
					<!-- 검색 기능 구조 추가 -->
					<div class="text-left container">
						<table class="col-12">
							<tr>
								<td align="left" class="col-12 col-sm-8"><select
									name="items" id="" class="control">
										<option value="subject">제목에서</option>
										<option value="content">본문에서</option>
										<option value="name">글쓴이에서</option>
								</select> <input type="text" name="text" /> <input type="submit"
									class="btn btn-primary" value="검색" /></td>
								<td align="right" class="col-12 col-sm-4"><a href="#"
									onclick="checkForm(); return false;" class="btn btn-warning">&laquo;글쓰기</a>
								</td>
							</tr>
						</table>
					</div>
				</form>
			</div>
		</div>
		<!-- row -->
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>



