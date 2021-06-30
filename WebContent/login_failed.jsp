<%
	//다시 로그인 페이지로 보내는데 에러 파라메터도 같이 보낸다.
	response.sendRedirect("login.jsp?error=1");
%>