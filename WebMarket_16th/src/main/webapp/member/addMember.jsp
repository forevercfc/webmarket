<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
		
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		
		
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add_member</title>

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
<body>
	
	<%-- addproduct 에서 가지고옴 --%>
	<%@ include file="/menu.jsp" %>
	
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
	
			<h1 class="display-4"><fmt:message key="title"/>회원가입</h1>
	
		</div>
	</div>
	 
	 
	<div class="container mb-5">
		<div class="row">
			<div class="col-md-8 px-0">
			
							
				<form name="newMember" action="<c:url value="/member/processAddMember.jsp"/>">
				
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id" placeholder="id">
					</div>
					
					
					
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="text" class="form-control" id="pw" name="pw" placeholder="pw">
					</div>
					
					

					<div class="form-group">
						<label for="pw_confirm">비밀번호 확인</label>
						<input type="text" class="form-control" id="pw_confirm" name="pw_confirm" placeholder="pw_confirm">
					</div>
					
					<div class="form-group">
						<label for="name">이름</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="name">
					</div>


					<div class="form-group row">
						<label for="gender" class="col-sm-2">성별</label>
						<div class="col-sm-10">
							<input  type="radio" name="gender" value="남" />남
							<input type="radio" name="gender" value="여" />여
						
						</div>
					</div>


					<div class="form-group">
						<label for="birth">생년월일</label> <br />
						<input type="text" class="form-control d-inline w-25" id="birth" name="birth_yy" placeholder="년도(4글자)" maxlength="4">
						<select name="birth_mm" class="form-control d-inline w-25">
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
						<input type="text" class="form-control d-inline w-25" id="birth" name="birth_dd" placeholder="일(2글자)" maxlength="2">
					</div>


					<div class="form-group">
						<label for="mail1">이메일</label> <br />
						<input type="text" class="form-control w-25 d-inline" id="mail1" name="mail1" placeholder="이메일">
						@
						<select name="mail2" class="form-control w-50 d-inline">
							<option>naver.com</option>
							<option>gmail.com</option>
							<option>hotmail.com</option>
						</select>
					</div>



					<div class="form-group">
						<label for="phone">전화번호</label>
						<input type="text" class="form-control" id="phone" name="phone" placeholder="phone">
					</div>


					<div class="form-group">
						<label for="address">주소</label>
						<input type="text" class="form-control" id="adress" name="address" placeholder="address">
					</div>

					<%-- 
					<input type="button" class="btn btn-primary" value="등록" onclick="chechForm()"></input> --%>
					<input type="submit" class="btn btn-primary" value="등록" onclick="checkForm()"></input>
					<input type="reset" class="btn btn-danger" value="취소" onclick="reset()"></input>




				</form>
			
			</div>
		</div>
	</div>
	
	
	<%@ include file="/footer.jsp" %>
	
</body>
</html>