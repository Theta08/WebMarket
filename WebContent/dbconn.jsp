<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	Connection conn = null;

	try {
		String url = "jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false";
		String user = "root";
		String password = "1234";

		// 1.드라이버 파일 => lib폴더에 넣기
		// 2.드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
		// 3.커넥션 객체(mysql서버에 접속하기 위해 주소,유저,비번)
		conn = DriverManager.getConnection(url, user, password);
		//out.println("DB 연결이 성공했습니다.");
		
	} catch (SQLException ex){
		out.println("데이터베이스 연결이 실패했습니다.");
		out.println(ex.getMessage());
		
	}
%>