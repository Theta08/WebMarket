<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<% 
// addProduct 페이지에서 넘어온 파라메터들을 처리한다.

	//한글처리
	request.setCharacterEncoding("UTF-8");

	//파일 업로드 객체 multi를 생성 이때 (request,저장경로,파일용량,인코딩,중복됬을경우+1)
	MultipartRequest multi = new MultipartRequest(request, "C:\\upload", 5 * 1024 * 1024, "utf-8",	new DefaultFileRenamePolicy());

	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	// 이미지의 파일이름을 받는다.
	String fileName = multi.getFilesystemName("productImage");
	// 가격과 재고수는 문자열로 넘어왔지만 숫자로 처리한다.
	Integer price;
	// 가격을 적지 않았으면(빈칸) 0 , 숫자문자열을 숫자로 변환한다.
	if(unitPrice.isEmpty()) price = 0;
	else price = Integer.valueOf(unitPrice);
	
	long stock;
	
	if(unitsInStock.isEmpty()) stock = 0;
	else stock = Long.valueOf(unitsInStock);
	
	PreparedStatement pstmt = null;
	// sql 입력
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setString(6, manufacturer);
	pstmt.setLong(7, stock);
	pstmt.setString(8, condition);
	pstmt.setString(9, fileName);
	pstmt.executeUpdate();
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	// 다시 목록 페이지로 이동
	response.sendRedirect("products.jsp");

%>






