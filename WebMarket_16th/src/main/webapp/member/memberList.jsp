<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>


	<sql:setDataSource var="dataSource"
		driver="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@localhost:1521:xe" user="C##dbexam"
		password="m1234" />


	<sql:query var="rs" dataSource="${dataSource }">
	select * from member
</sql:query>


	<%@ include file="/menu.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col px-0">


				<div class="jumbotron jumbotron-fluid">
					<div class="container text-center">

						<h1 class="display-4">회원목록</h1>

					</div>

				</div>


				<div class="container table-responsive">
					<table class="table table-sm table-striped" align="center">
						<tr class="table-active">
							<c:forEach var="columnName" items="${rs.columnNames }">
								<th width="100"><c:out value="${columnName}"></c:out></th>
							</c:forEach>
						</tr>
						<c:forEach var="row" items="${rs.rowsByIndex }">
							<tr>
								<c:forEach var="column" items="${row }">
									<td>
									
										<c:if test="${column != null }">
											
											<c:out value="${column}"/>
										
										</c:if>
										
										<c:if test="${column == null }">
											
											<mark>데이터 없음</mark>
										
										</c:if>
									</td>
									
								</c:forEach>
							</tr>
						</c:forEach>
					</table>
				</div>



			</div>

		</div>
	</div>
	<%@ include file="/footer.jsp"%>

</body>
</html>