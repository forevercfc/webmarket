<%@page import="java.util.*"%>
<%@page import="mvc.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/* String sessionId = (String) session.getAttribute("sessionId"); */
int pageNum = (Integer) request.getAttribute("pageNum");
List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardlist");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<body>
    <%@ include file="/menu.jsp"%>

    <div class="container-fluid">
        <div class="row">
            <div class="col px-0">

                <div class="jumbotron jumbotron-fluid">
                    <div class="container text-center">
                        <h1 class="display-4">게시판</h1>
                    </div>
                </div>
                <div class="container table-responsive">
                    <table class="table">
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>수정일</th>
                            <th>조회수</th>
                            <th>글쓴이</th>
                        </tr>
                        <%
                            for(int i = 0; i < boardList.size(); i++) {
                                BoardDTO boardDTO = boardList.get(i);
                        %>
                        <tr>
                            <td><%= boardDTO.getNum() %></td>
                            <td><%= boardDTO.getSubject() %></td>
                            <td><%= boardDTO.getRegist_day() %></td>
                            <td><%= boardDTO.getUpdate_day() %></td>
                            <td><%= boardDTO.getHit() %></td>
                            <td><%= boardDTO.getName() %></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/footer.jsp"%>
</body>
</html>
