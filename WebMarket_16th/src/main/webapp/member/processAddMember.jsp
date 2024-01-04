<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
   request.setCharacterEncoding("utf-8");

   String id=request.getParameter("id");
   String pw=request.getParameter("pw");
   String name=request.getParameter("name");
   String gender=request.getParameter("gender");
   String year=request.getParameter("biryy");
   String month=request.getParameter("birmm");
   String day=request.getParameter("birdd");
   String birth=year+"-"+month+"-"+day;
   String mail1=request.getParameter("mail1");
   String mail2=request.getParameter("mail2");
   String mail=mail1+"@"+mail2;
   String phone=request.getParameter("phone");
   String address=request.getParameter("address");
%>
<sql:setDataSource 
var="dataSource" 
driver="oracle.jdbc.driver.OracleDriver" 
url="jdbc:oracle:thin:@localhost:1521:xe" 
user="C##dbexam"
password="m1234"/>

<sql:update dataSource="${dataSource}" var="rs">
      insert into member (mem_num, id, password, name, gender, birth, mail, phone, address, logtime)
      values (seq_num.nextval,?,?,?,?,?,?,?,?,sysdate)
      <sql:param value="<%=id%>"/>
      <sql:param value="<%=pw%>"/>
      <sql:param value="<%=name%>"/>
      <sql:param value="<%=gender%>"/>
      <sql:param value="<%=birth%>"/>
      <sql:param value="<%=mail%>"/>
      <sql:param value="<%=phone%>"/>
      <sql:param value="<%=address%>"/>
</sql:update>

<c:if test="${rs>=1}">
   <c:redirect url="resultMember.jsp?msg=1"/>
</c:if>
