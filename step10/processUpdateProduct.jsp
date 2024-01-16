<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	//이미지 등록
	String filename="";
	
	String realFolder = application.getRealPath("/resources/images"); //웹 어플리케이션의 절대 경로 설정
	/* String realFolder = "C:\\Users\\GREEN\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WebMarket_16th\\resources\\images"; */
	String  encType = "utf-8";
	int maxSize = 5*1024*1024;//업로드 가능한 이미지 최대파일용량 설정
	
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType, new DefaultFileRenamePolicy());
	//MultipartRequest객체의 생성자 함수에 매개변수를 넣어서 원하는 설정값 지정
	
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	/* 클래스 타입은 db에 저장안되므로 integer를 int로 변경 */
	int price;
	if(unitPrice.isEmpty()) price=0;
	else price = Integer.valueOf(unitPrice); 
	
	long stock;
	if(unitsInStock.isEmpty()) stock=0;
	else stock=Long.valueOf(unitsInStock); 
	
	Enumeration files =multi.getFileNames(); //type="file"속성을 가진 파라미터의 이름을 Enumeration 타입으로 리턴
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	/* select구문으로 원하는 p_id에 맞는 데이터를 가져옴 */
	String sql = "select * from product where p_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,productId);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName != null){
			sql = "update product set p_name=?, p_unitPrice=?, p_description=?,p_category=?,p_manufacturer=?,p_unitsInStock=?,p_filename=? where p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pname);
			pstmt.setInt(2,price); //정수
			pstmt.setString(3,description);
			pstmt.setString(4,category);
			pstmt.setString(5,manufacturer);
			pstmt.setLong(6,stock); //실수
			/* pstmt.setString(7,condition); */
			pstmt.setString(7,fileName);
			pstmt.setString(8,productId);
			pstmt.executeUpdate();	
		}else{
			sql = "update product set p_name=?, p_unitPrice=?, p_description=?,p_category=?,p_manufacturer=?,p_unitsInStock=? where p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pname);
			pstmt.setInt(2,price); //정수
			pstmt.setString(3,description);
			pstmt.setString(4,category);
			pstmt.setString(5,manufacturer);
			pstmt.setLong(6,stock); //실수
			/* pstmt.setString(7,condition); */
			pstmt.setString(7,productId);
			pstmt.executeUpdate();	
		}
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>








