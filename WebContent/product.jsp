<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %> --%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<%@ page import="java.sql.*" %>
<!-- DB연결 -->
<%@ include file="dbconn.jsp" %> 
<html>
<head>
<link rel="stylesheet" 	href="resources/css/bootstrap.min.css">
<title>상품 상세 정보</title>
	<script>
		function addToCart(){
			if(confirm("상품을 장바구니에 추가하시겠습니까?")){
				document.addForm.submit(); //YES일때 서버로 보낸다.
			} else {
				document.addForm.reset(); //NO는 안보낸다.리셋
			}
		}
	</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		// 제품목록 페이지에서 넘어온 아이디의 값을 가져온다.
		// id="p1234" 만약에 id가 넘어오지 않으면 오류발생 => 에러페이지에서 처리
		String id = request.getParameter("id");
	
		//상품 리파지토리 객체를 가져온다. (Static객체)
		//ProductRepository dao = ProductRepository.getInstance();
		// 스테틱 인스턴스 객체를 가져와서 업데이트 된 제품 리스트에서 제품을 찾음
		//Product product = dao.getProductById(id);
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		//DB에서 id를 입력하여 제품행을 가져온다.
		String sql="select * from product where p_id=?";
		pstmt = conn.prepareStatement(sql);	//sql문 준비
		pstmt.setString(1,id);
		rs=pstmt.executeQuery();//만약 id에 맞는 상품이 있으면 결과가 있음
		
		if(rs.next()){	//괄호와 괄호 사이에 rs.메소드로 상품의 정보를 가져온다.
	%>
		<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img style="width: 100%" src="c:/upload/<%=rs.getString("p_fileName")%>">
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("p_name")%></span>
				<p><b>제조사</b> : <%=rs.getString("p_manufacturer")%>
				<p><b>분류</b> : <%=rs.getString("p_category")%>
				<p><b>재고 수</b> : <%=rs.getString("p_unitsInStock")%>
				<h4><%=rs.getString("p_unitPrice")%>원</h4>
				<p>
				<form name="addForm" action="addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
					<a href="#" onclick="addToCart();" class="btn btn-info"> 상품 주문 &raquo;</a> 
					<a href="./cart.jsp" class="btn btn-warning"> 장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<%
		}
	%>
	
	<jsp:include page="footer.jsp" />
</body>
</html>
