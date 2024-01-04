<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<%
	String sessionId = (String)session.getAttribute("sessionId");
%>


<sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="C##dbexam" password="m1234"/>

<sql:update dataSource="${dataSource }" var="rs">
	delete from member where id=?
	
	<sql:param value="<%=sessionId %>"/>
	
	
</sql:update>

<c:if test="${rs>=1 }">

	<c:import url="logoutMember.jsp"></c:import>
	<c:redirect url="resultMember.jsp"/>
	
</c:if>