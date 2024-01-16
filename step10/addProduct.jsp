<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<title>Welcome</title>
<script src="../resources/js/validation.js"></script>
</head>
<body>
	
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message" >
	
	<!-- 관리자계정의 판매자가 웹 쇼핑몰의 상품 정보를 등록하는 form양식 -->
	<%@ include file="/menu.jsp"%>
	<div class="jumbotron jumbotron-fluid">
		<div class="container text-center">
			<%-- 각 텍스트 컨텐츠에 해당하는 부분을 message태그를 이용해서 <fmt:message key="properties 파일의 속성명"/>으로 변경 --%>
			<h1 class="display-4"> <fmt:message key="title"/> </h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="text-right">
					<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<form action="./processAddProduct.jsp" name="newProduct" method="post" enctype="multipart/form-data">
					<div class="form-group row text-left">
					    <label for="productId" class="col-sm-2 col-form-label"><fmt:message key="productId"/></label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="productId" name="productId">
					    </div>
					 </div>
					 <div class="form-group row text-left">
					    <label for="name" class="col-sm-2 col-form-label"><fmt:message key="pname"/></label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="name" name="pname">
					    </div>
					 </div>
					 <div class="form-group row text-left">
					    <label for="unitPrice" class="col-sm-2 col-form-label"><fmt:message key="unitPrice"/></label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="unitPrice" name="unitPrice">
					    </div>
					 </div>
					<div class="form-group row text-left">
						<label for="description" class="col-sm-2 col-form-label"><fmt:message key="description"/></label>
						<div class="col-sm-5">
							<textarea class="form-control" id="description"
								rows="3" name="description"></textarea>
						</div>
					</div>
					<div class="form-group row text-left">
					    <label for="manufacturer" class="col-sm-2 col-form-label"><fmt:message key="manufacturer"/></label></label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="manufacturer" name="manufacturer">
					    </div>
					 </div>
					 <div class="form-group row text-left">
					    <label for="category" class="col-sm-2 col-form-label"><fmt:message key="category"/></label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="category" name="category">
					    </div>
					 </div>
					 <div class="form-group row text-left">
					    <label for="unitsInStock" class="col-sm-2 col-form-label"><fmt:message key="unitsInStock"/></label>
					    <div class="col-sm-5">
					      <input type="text" class="form-control" id="unitsInStock" name="unitsInStock">
					    </div>
					 </div>
					 <div class="form-group row text-left">
					    <label for="condition" class="col-sm-2 col-form-label"><fmt:message key="condition"/></label>
					    <div class="col-sm-5">
					      <input type="radio" name="condition" id="condition" value="new" checked><fmt:message key="condition_New"/>
					      <input type="radio" name="condition" id="condition" value="old"><fmt:message key="condition_Old"/>
					      <input type="radio" name="condition" id="condition" value="recycling"><fmt:message key="condition_ReCycling"/>
					    </div>
					 </div>
					  
					 <!-- 이미지를 업로드하는 부분 추가 -->
					 <div class="form-group row text-left">
					    <label class="col-sm-2 col-form-label"><fmt:message key="productImage"/></label>
					    <div class="col-sm-5">
					      <input type="file" class="form-control" name="productImage" value="등록">
					    </div>
					 </div>
					 
					 <div class="form-group row text-left">
					    <label for="inputPassword" class="col-sm-2 col-form-label"><fmt:message key="button"/></label>
					    <div class="col-sm-5">
					      <input type="button" class="btn btn-info" value="<fmt:message key='button'/>" onclick="checkAddProduct()">
					    </div>
					 </div>
					 
				</form>
				<!-- 1)input태그의 name속성값을 이용해서 데이터를 전달하며 request.getParameter("name의 속성명")을 이용해서 해당 input태그에 입력한 데이터를 전달받는다. => processAddProduct.jsp 이동-->
			
			</div><!-- col -->
		</div><!-- row -->
	</div><!-- container-fluid -->
	<%@ include file="footer.jsp"%>
	 <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    </fmt:bundle>
</body>
</html>



