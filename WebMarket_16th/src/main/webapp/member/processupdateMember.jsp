<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<!-- process_Add_member 복사 -->

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	
	String year = request.getParameter("birth_yy");
	String month = request.getParameter("birth_mm");
	String day = request.getParameter("birth_dd");
	String birth = year + "-" + month + "-" + day;
	
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String mail = mail1 + "@" + mail2;
	
	String phone = request.getParameter("phone");
	String adress = request.getParameter("adress");
	
	
	
	
%>


<sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="C##dbexam" password="m1234"/>





	<sql:update dataSource="${dataSource}" var="rs">
	
		update web_member set password=?, name=?, gender=?, birth=?, mail=?, phone=?, adress=?, updatetime=sysdate where id=?
		

		<sql:param value="<%=pw %>"/>
		<sql:param value="<%=name %>"/>
		<sql:param value="<%=gender %>"/>
		<sql:param value="<%=birth %>"/>
		<sql:param value="<%=mail %>"/>
		<sql:param value="<%=phone %>"/>
		<sql:param value="<%=adress %>"/>
		<sql:param value="<%=id %>"/>
		
	</sql:update>
	
	
	<c:if test="${rs>=1}">
		<c:redirect url="result_member.jsp?msg=0"/>
	</c:if>
	
	<!-- 매개변수 msg를 0을 가지갔을 때에는 회원정보 수정 문구가 뜨고, 1을 가져갔을 때에는 회원가입문구, null일 때는 회원정보 삭제 문구를 출력하겠다고 설정한 상태임 -->