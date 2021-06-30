<%
	session.invalidate(); //관리자로 저장된 내용을 초기화 로그아웃한다.
	response.sendRedirect("addProduct.jsp");
%>