<!-- utf-8설정 및 페이지 정보 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<%@ include file="menu.jsp" %>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				상품목록
			</h1>
		</div>
	</div>	

	<div class="container">
		<div class="row text-center">
		
			<%@ include file="dbconn.jsp" %>
		
			<% 
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
			%>
				<div class="col-md-4">
					<img style="width: 100%" src="c:/upload/<%=rs.getString("p_fileName") %>">
					<h3><%=rs.getString("p_name") %></h3>
					<p><%=rs.getString("p_description") %></p>
					<p><%=rs.getString("p_unitPrice") %> 원</p>
					<p><a href="product.jsp?id=<%=rs.getString("p_id")%>" 
					      class="btn btn-secondary">상세정보 &raquo;</a>
				</div>				
			<% 		
				}
			%>					
		</div>
		<hr>
	</div>	
	<%@ include file="footer.jsp" %>
</body>
</html>