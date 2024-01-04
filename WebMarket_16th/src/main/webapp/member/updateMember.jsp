<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
		
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
   integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
   crossorigin="anonymous">

<title>update_member</title>

<%@ include file="../menu.jsp" %>


<%-- 
<%
	String sessionId = (String)session.getAttribute("sessionId");
%>
--%>

<sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="C##dbexam" password="m1234"/>

<sql:query var="resultSet" dataSource="${dataSource}">
	select * from member where id=?
	<sql:param value="<%=sessionId %>"/>
</sql:query>
	
	

<script>

	function checkForm() {
		if(!document.newMember.id.value) {
			alert("아이디를 입력하세요");
			return false;
		}
		
		if(!document.newMember.pw.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
		
		if(document.newMember.pw.value != document.newMember.pw_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		
		
		if(!document.newMember.name.value) {
			alert("이름을 입력해주세요");
			return false;
		}
		
		document.newMember.submit();
	}

</script>


</head>


<body>  <!--  onload="init()" -->
	
	<%-- addproduct 에서 가지고옴 --%>

	
	
	
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
	
			<h1 class="display-4"><fmt:message key="title"/>회원수정</h1>
	
		</div>
	</div>
	
	
	<sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="C##dbexam" password="m1234"/>
	
	
	<c:forEach var="row" items="${resultSet.rows}">
		
		<c:set var="mail" value="${row.mail}"/>
		<c:set var="mail1" value="${mail.split('@')[0]}"/>
		<c:set var="mail2" value="${mail.split('@')[1]}"/>
		
		
		<c:set var="birth" value="${row.birth}"/>
		<c:set var="year" value="${birth.split('-')[0]}"/>
		<c:set var="month" value="${birth.split('-')[1]}"/>
		<c:set var="day" value="${birth.split('-')[2]}"/>
		
		<div class="container mb-5">
			<div class="row">
				<div class="col-md-8 px-0">
				
								
					<form name="newMember" action="<c:url value="/member/processupdateMember.jsp" />" method="post" onsubmit="return checkForm()">
					
						<div class="form-group">
							<label for="id">아이디</label>
							
							
							<input  type="text" class="form-control" id="id" name="id" placeholder="id" value="<c:out value='${row.id }' />" readonly hidden>
						</div>
						
						
						
						<div class="form-group">
							<label for="pw">비밀번호</label>
							<input type="password" class="form-control" id="pw" name="pw" placeholder="pw" value="<c:out value='${row.password }'/>">
						</div>
						
						
	
						<div class="form-group">
							<label for="pw_confirm">비밀번호 확인</label>
							<input type="text" class="form-control" id="pw_confirm" name="pw_confirm" placeholder="pw_confirm">
						</div>
						
						<div class="form-group">
							<label for="name">이름</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="name" value="<c:out value='${row.name }'/>">
						</div>
	
	
						<div class="form-group row">
							<label for="gender" class="col-sm-2">성별</label>
							<div class="col-sm-10">
								
								<c:set var="gender" value="${row.gender }"/>
								
								<input  type="radio" name="gender" value="남" 
									<c:if test="${gender.equals('남') }">
										<c:out value="checked"/>
									</c:if>
								/>남
								
								<input type="radio" name="gender" value="여" 
									<c:if test="${gender.equals('여') }">
										<c:out value="checked"/>
									</c:if>
								/>여
							
							</div>
						</div>
						
						
	
	
						<div class="form-group">
							<label for="birth">생년월일</label> <br />
							<input type="text" class="form-control d-inline w-25" id="birth" name="birth_yy" placeholder="년도(4글자)" maxlength="4" value="<c:out value='${year }'/>">
							
							
							<select name="birth_mm" class="form-control d-inline w-25" id="birthmm">
								
								<%-- 
								<option value="">${month }</option>
								--%>
								
								<option value="">월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								
								
							</select>
							<input type="text" class="form-control d-inline w-25" id="birth" name="birth_dd" placeholder="일(2글자)" maxlength="2" value="<c:out value='${day }'/>">
						</div>
	
	
						<div class="form-group">
							<label for="mail1">이메일</label> <br />
							
							<input type="text" class="form-control w-25 d-inline" id="mail1" name="mail1" placeholder="이메일" value="<c:out value='${mail1 }'/>">
							@
							<select name="mail2" class="form-control w-50 d-inline" id="mail2">
								<option>naver.com</option>
								<option>gmail.com</option>
								<option>hotmail.com</option>
							</select>
						</div>
	
	
	
						<div class="form-group">
							<label for="phone">전화번호</label>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="phone" value="<c:out value='${row.phone }'/>">
						</div>
	
	
						<div class="form-group">
							<label for="adress">주소</label>
							<input type="text" class="form-control" id="adress" name="adress" placeholder="adress" value="<c:out value='${row.adress }'/>">
						</div>
	
						<%-- 
						<input type="button" class="btn btn-primary" value="등록" onclick="chechForm()"></input> --%>
						<input type="submit" class="btn btn-primary" value="수정" ></input>
						<a class="btn btn-danger" href='<c:url value="deleteMember.jsp" />'>"탈퇴</a>
	

	
	
					</form>
				
				</div>
			</div>
		</div>
		
		
	
	</c:forEach>
	
	<%@ include file="/footer.jsp" %>
	
	
<script>

	/*
	window.onload = function() {
		init();
	}
	*/
	
	
	

	$(function() {
		init();
		
		function init() {
			setComboMailValue('${mail2}');
			setComboBrithValue('${month}');
			

		}
	})

	function setComboMailValue(val) {
		var selectMail = document.getElementById('mail2');
		
		for(i=0, j=selectMail.options.length; i<j; i++) {

			if(selectMail.options[i].value==val) {
				selectMail.options[i].selected = true;
				break;
			}
		}
	}

	
	function setComboBrithValue(val) {
		var selectBirth = document.getElementById('birthmm');
		
		for(i=0, j=selectBirth.options.length; i<j; i++) {

			if(selectBirth.options[i].value==val) {
				selectBirth.options[i].selected = true;
				break;
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
</script>
	
	
</body>
</html>